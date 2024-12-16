// ignore: file_names
// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:myfriendfaith/core/smtp/verification.dart';
import 'package:myfriendfaith/widgets/modals/verificationCode_modal.dart';
import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfriendfaith/utils/validator/signup.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<bool> signUpUser(
    String? email, String? password, String? name, BuildContext context) async {
  //To Check this Credential is allowed to sign up?
  //Condition 1.
  //Valid Credential
  //Condition 2.
  //Not Banned Due to Too much try within one hour.
  bool allowed = await checkSignUpAllow(context, email!, password!);
  if (!allowed) return false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    //To Check the Verification Code.
    //Condition
    //Valid Email (SMTP SERVER EMAIL ADDRESS and Password.)
    String? code = await sendNewCode(email, context);
    if (code == null) return false;

    //To Show the Verificaiton code check modal.
    final returnValue = await showDialog(
        context: context,
        builder: (context) => VerificationCodeModal(
            code: code,
            resendCode: () async {
              await sendNewCode(email, context);
            }));

    //If the user has entered the correct code.
    if (returnValue != null) {
      showStateSnackBar(context, 'Wait for a seconds', 'info');
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      await userCredential.user?.updateDisplayName(name!);
      await userCredential.user?.reload();
      User? updatedUser = await _auth.currentUser;
      showStateSnackBar(context,
          'Welcome ${updatedUser?.displayName} To Faith AI Friend', 'success');
    }
    return true;
  } on FirebaseAuthException catch (e) {
    showStateSnackBar(context, e.message!, 'error');
    print(e.message);
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<String?> sendNewCode(String email, BuildContext context) async {
  try {
    var box = await Hive.openBox('myBox');
    int? count = box.get('sendCount');
    String? tempdate = box.get('lastSendTime');
    DateTime date =
        tempdate == null ? DateTime.now() : DateTime.parse(tempdate);
    DateTime current = DateTime.now();
    int difference = date.difference(current).inHours;
    if (count == 3 && difference.abs() < 1) {
      showStateSnackBar(context, "Please Retry after 1 hour!!!", "error");
      return null;
    }
    String code = generateRandomCode();
    bool success = await sendVerificationCode(code, email, context);
    print(code);
    box.put('verificationCode', code);
    await updatePreferences();
    if (success) {
      return code;
    }
  } catch (e) {
    showStateSnackBar(context, 'Sending Verification Code was Failed', 'error');
    print(e);
    return null;
  }
  showStateSnackBar(context, 'Sending Verification Code was Failed', 'error');
  return null;
}

Future<bool> checkSignUpAllow(
    BuildContext context, String email, String password) async {
  bool errorMessage = signUpValidator(email, password);
  if (!errorMessage) {
    print("Invalid Credentials");
    showStateSnackBar(context, "InValid User Credentials!!!", "error");
    return false;
  }
  return true;
}

Future<bool> updatePreferences() async {
  //To Update the Preferences
  //When the verification code is sent.
  var box = await Hive.openBox('myBox');
  int? currentCount = box.get('sendCount');
  String? tempdate = box.get('lastSendTime');
  DateTime date = tempdate == null ? DateTime.now() : DateTime.parse(tempdate);
  int difference = date.difference(DateTime.now()).inHours;

  if (difference.abs() > 1) {
    box.put('sendCount', 1);
    box.put('lastSendTime', DateTime.now().toString());
    return true;
  }
  int newCount = currentCount == null ? 1 : currentCount + 1;
  if (newCount > 3) {
    newCount = 1;
  }
  box.put('sendCount', newCount);
  box.put('lastSendTime', DateTime.now().toString());
  return true;
}
