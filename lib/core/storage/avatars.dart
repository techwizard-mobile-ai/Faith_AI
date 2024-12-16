import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<String?> uploadAvatar(File? imageFile, String uid) async {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  if (imageFile != null) {
    final ref = _storage.ref().child('avatars/${uid}.jpg');
    await ref.putFile(imageFile);
    final downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }
}
