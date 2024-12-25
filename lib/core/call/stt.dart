import "dart:async";
import "dart:isolate";
import "dart:typed_data";
import "dart:convert";
import "dart:io";
import "package:flutter_sound/flutter_sound.dart";
import "package:http/http.dart" as http;
import 'package:permission_handler/permission_handler.dart';

class CustomSTT {
  bool _isRecording = true;
  bool _isThinking = false;
  DateTime? currentTime = DateTime.now();
  DateTime? _voiceEndTime = DateTime.now();
  int _voiceThreshold = 110; // Amplitude threshold for detecting voice
  BytesBuilder voiceData = BytesBuilder();
  Function() setBotSaying;
  Function(String msg) sayToBot;

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  late StreamController<Uint8List> _audioStreamController;

  CustomSTT(this.setBotSaying, this.sayToBot);

  //Start Recording
  //1.Check the User is speaking or not, with threshhold
  //2. Send to the Google STT
  //3. Get the Response of it.
  Future<void> startRecording() async {
    try {
      _audioStreamController = StreamController<Uint8List>();
      final microphonePermission = await Permission.microphone.request();
      final storagePermission = await Permission.storage.request();
      if (microphonePermission.isGranted && storagePermission.isGranted) {
        await _recorder.openRecorder();
        await _recorder.startRecorder(
            toStream: _audioStreamController.sink, codec: Codec.pcm16);
        _audioStreamController.stream.listen((data) async {
          if (_isThinking) return;
          if (data.indexOf(_voiceThreshold) >= 0) {
            if (!_isRecording) {
              this._isRecording = true;
            }
            if (_isRecording) {
              voiceData.add(data);
              _voiceEndTime = DateTime.now();
              return;
            }
          } else {
            if (_isRecording &&
                _voiceEndTime!.difference(currentTime!).inMilliseconds.abs() <
                    1000) {
              this._isRecording = false;
            }
          }
          currentTime = DateTime.now();

          if ((!_isRecording &&
              _voiceEndTime!.difference(currentTime!).inMilliseconds.abs() >=
                  2000)) {
            this._isRecording = true;
            this._isThinking = true;
            this.setBotSaying();
            _sendToGoogleSTT(voiceData.toBytes());
          }
        });
      } else
        print("Microphone permission is not granted!!!");
    } catch (e) {
      print("Here is the error $e");
      print(e);
    }
  }

//For Translate my voice
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
      final decodedRes = json.decode(response.body);
      String duration = decodedRes['totalBilledTime']
          .substring(0, decodedRes['totalBilledTime'].length - 1);
      if (int.parse(duration) > 0) {
        if (decodedRes['results'] != null &&
            decodedRes['results'][0]['alternatives'][0]["transcript"] != null) {
          print("Get the Translated my Voice");
          this.setBotSaying();
          this.sayToBot(
              decodedRes['results'][0]['alternatives'][0]["transcript"]);
        }
      }
    } else
      print("Failt to STT");
    this._isThinking = false;
    // this.setBotSaying();
    voiceData = BytesBuilder();
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
    await _recorder.closeRecorder();
    _audioStreamController.close();
  }
}
