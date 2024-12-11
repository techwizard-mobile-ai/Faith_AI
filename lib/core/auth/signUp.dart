// ignore: file_names
// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:faith_mobile/utils/validator/signup.dart';

Future<String?> signUpUser(String? email, String? password) async {
  bool errorMessage = signUpValidator(email, password);
  if (!errorMessage) {
    print("Invalid Credentials");
    return "Invalid Credentials";
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
    userCredential.user?.sendEmailVerification();
    print("User signed Up: ${userCredential.user?.uid}");
    return null;
  } on FirebaseAuthException catch (e) {
    print(e.message);
    return e.message;
  }
}
