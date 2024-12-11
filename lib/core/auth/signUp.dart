// ignore: file_names
// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:faith_mobile/utils/validator/signup.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String?> signUpUser(String? email, String? password) async {
  bool errorMessage = signUpValidator(email, password);
  if (!errorMessage) {
    print("Invalid Credentials");
    return "Invalid Credentials";
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    //     email: email!, password: password!);
    final Uri emailTemp = Uri(
        scheme: 'mailto',
        path: 'dylan1406lewis@gmail.com',
        query:
            'subject=Email Verification&body=Please verify your email address by clicking on the link below:');
    await launchUrl(emailTemp, mode: LaunchMode.externalApplication);
    // print("User signed Up: ${userCredential.user?.uid}");
    return null;
  } on FirebaseAuthException catch (e) {
    print(e.message);
    return e.message;
  }
}
