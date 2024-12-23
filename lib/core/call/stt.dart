import "dart:async";
import "dart:typed_data";
import "dart:convert";
import "dart:io";
import "package:flutter_sound/flutter_sound.dart";
import "package:http/http.dart" as http;
import 'package:permission_handler/permission_handler.dart';

class CustomSTT {
  bool _isRecording = true;
  DateTime? currentTime = DateTime.now();
  DateTime? _voiceEndTime = DateTime.now();
  double _voiceThreshold = 110; // Amplitude threshold for detecting voice
  Uint8List voiceData = Uint8List(0);

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  late StreamController<Uint8List> _audioStreamController;

  CustomSTT();
  Future<void> startRecording() async {
    try {
      _audioStreamController = StreamController<Uint8List>();
      final microphonePermission = await Permission.microphone.request();
      final storagePermission = await Permission.storage.request();
      if (microphonePermission.isGranted && storagePermission.isGranted) {
        await _recorder.openRecorder();
        await _recorder.startRecorder(
            toStream: _audioStreamController.sink, codec: Codec.pcm16);
        _audioStreamController.stream.listen((data) {
          double amplitude = _calculateAmplitude(data);
          if (amplitude > _voiceThreshold) {
            if (!_isRecording) {
              this._isRecording = true;
            }
            if (_isRecording) {
              voiceData = Uint8List.fromList(voiceData + data);
              _voiceEndTime = DateTime.now();
              return;
            }
          } else {
            if (_isRecording &&
                _voiceEndTime!.difference(currentTime!).inSeconds.abs() < 2) {
              this._isRecording = false;
            }
          }
          currentTime = DateTime.now();

          if (!_isRecording &&
              _voiceEndTime!.difference(currentTime!).inMilliseconds.abs() >=
                  2000) {
            this._isRecording = true;
            print("Sending to Google");
            _sendToGoogleSTT(voiceData);
          }
        });
      } else
        print("Microphone permission is not granted!!!");
    } catch (e) {
      print("Here is the error $e");
      print(e);
    }
  }

  double _calculateAmplitude(Uint8List audioData) {
    double sum = 0;
    for (int i = 0; i < audioData.length; i++) {
      sum += audioData[i];
    }
    return sum / audioData.length; // Average amplitude
  }

  Future<void> _sendToGoogleSTT(Uint8List audioData) async {
    print("Sending Sound");
    String base64Audio = base64Encode(audioData);
    final Uri uri = Uri.parse(
        "https://speech.googleapis.com/v1/speech:recognize?key=AIzaSyBDlG8AbVj2yLWZVQZxzd9-6YbZLmg7CF8");

    final Map<String, dynamic> requestBody = {
      "config": {
        "encoding": "LINEAR16",
        "sampleRateHertz": 16000,
        "languageCode": "en-US",
      },
      "audio": {
        "content": base64Audio,
      }
    };

    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody));
    if (response.statusCode == 200) {
      print(response.body);
    } else
      print("Failt to STT");
    voiceData = Uint8List(0);
  }
}
