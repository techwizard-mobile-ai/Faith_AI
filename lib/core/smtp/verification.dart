// ignore_for_file: prefer_const_constructors

import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:math';

String generateRandomCode() {
  int code = Random().nextInt(999999);
  return code.toString().padLeft(6, '0');
}

Future<bool> sendVerificationCode(
    String code, String emailAddress, BuildContext context) async {
  String userName = dotenv.env['EMAIL_USERNAME']!;
  String password = dotenv.env['EMAIL_PASSWORD']!;
  String smtpServerURL = dotenv.env['SMTP_SERVER_URL']!;

  final smtpServer = SmtpServer(smtpServerURL,
      username: userName, password: password, port: 587, ssl: false);
  final message = Message()
    ..from = Address("smtp@farmzasia.com", 'Faith Mobile')
    ..recipients.add(emailAddress)
    ..subject = 'Verification Code'
    ..text = 'Your verification code is: $code'
    ..html = """
  <div style="display: flex; flex-direction:column justify-content: center; align-items: center; height: 100vh; width:100%; position:relative;">
          <div style="position:relative; border: 1px solid grey; padding: 20px; border-radius:10px; display: flex; flex-direction: column; justify-content: flex-start; align-items:center">
            <div style="width:100%;border-bottom: 2px solid black; display:flex; justify-content:center; align-items:center">
              <h1>Welcome To Friend Faith AI!</h1>
            </div>
            <div style="margin-top:50px; font-size:20px">
              We found you are trying to create an account.<br>
              This is the Verification Code: <strong>$code</strong><br>
              Please Check your Activity with This code.<br>
            </div>
            <div style="display:flex; justify-content:center; align-items:center; font-size:20px">
              <h4>Welcome Aboard</h4>
            </div>
          </div>
      </div>
""";
  try {
    final sendReport = await send(message, smtpServer);
    showStateSnackBar(context, "Verification Code Sent", "success");
    print('Message sent: ' + sendReport.toString());
    return true;
  } catch (e) {
    print(e);
    return false;
  }
  return false;
}
