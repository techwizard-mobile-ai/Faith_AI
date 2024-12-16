import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';

Future<void> deleteAccount(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await user.delete();
    showStateSnackBar(context, 'You Delete Your Account!!!', "info");
  } else {
    print("No User is currently signed in.");
  }
}
