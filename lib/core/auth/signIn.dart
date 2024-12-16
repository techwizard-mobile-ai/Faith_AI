import 'package:myfriendfaith/utils/validator/email.dart';
import 'package:myfriendfaith/utils/validator/password.dart';
import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';

Future<void> SiginInWithEmail(
    String email, String password, BuildContext context) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? errorMessageEmail = emailValidator(email);
  String? errorMessagePassword = passwordValidator(password);

  if (errorMessagePassword != null) {
    showStateSnackBar(context, errorMessagePassword, 'error');
    return null;
  } else if (errorMessageEmail != null) {
    showStateSnackBar(context, errorMessageEmail, 'error');
    return null;
  }

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    print(userCredential.user?.displayName);
    context.router
        .push(DashboardScreen(displayName: userCredential.user?.displayName));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-credential') {
      showStateSnackBar(context, "Email or Password is incorrect.", "error");
    }
  }
}
