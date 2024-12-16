// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_super_parameters, library_private_types_in_public_api

import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';
import 'package:myfriendfaith/widgets/verification_Input.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class VerificationCodeModal extends StatefulWidget {
  String? code;
  Function() resendCode;
  VerificationCodeModal({Key? key, this.code, required this.resendCode})
      : super(key: key);

  @override
  _VerificationCodeModalState createState() => _VerificationCodeModalState();
}

class _VerificationCodeModalState extends State<VerificationCodeModal> {
  bool _isLoading = false;
  String? code;
  int? _sendCount;
  DateTime _lastSendTime = DateTime.now();
  int differenceInHours = 0;
  final currentDate = DateTime.now();
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  //Read the preferences from the hive box
  Future<void> _getExternalData() async {
    var box = await Hive.openBox('myBox');
    String? tempDate = await box.get('lastSendTime');
    setState(() {
      _sendCount = box.get('sendCount');
      if (tempDate != null) _lastSendTime = DateTime.parse(tempDate);
      if (_sendCount == null) {
        box.put('sendCount', 1);
        _sendCount = 1;
      }
      if (tempDate != null) {
        box.put('lastSendTime', currentDate.toString());
        differenceInHours = currentDate.difference(_lastSendTime).inHours;
      }
      code = box.get('verificationCode');
    });
  }

  //To Check if resendin is allowed for user?
  bool canResend() {
    if (_sendCount! <= 3) {
      return true;
    } else {
      if (differenceInHours.abs() < 1) {
        return false;
      } else {
        return true;
      }
    }
  }

  //Resend Code
  Future<void> resendCode() async {
    if (canResend()) {
      setState(() {
        _isLoading = true;
      });
      await widget.resendCode();
      await _updateExternalData();
      setState(() {
        _isLoading = false;
      });
    } else {
      showStateSnackBar(context, "You can resend after 1 hour", "error");
    }
  }

  //Update Preferences.
  Future<void> _updateExternalData() async {
    var box = await Hive.openBox('myBox');
    int? newCount = box.get('sendCount');
    String? date = box.get('lastSendTime');
    DateTime lastTime = DateTime.parse(date!);
    setState(() {
      _sendCount = newCount;
      _lastSendTime = lastTime;
      code = box.get('verificationCode');
    });
  }

  @override
  initState() {
    super.initState();
    _getExternalData();

    //Initialize the controllers
    for (int i = 0; i < 6; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          if (i < 5) {
            _focusNodes[i + 1].requestFocus();
          }
        } else if (_controllers[i].text.isEmpty) {
          if (i > 0) {
            _focusNodes[i - 1].requestFocus();
          }
        }
      });
    }
  }

  void checkCode() {
    print(code);
    if (getInputCode() == code) {
      Navigator.pop(context, 'success');
    } else {
      showStateSnackBar(context, "Not Valid Code", "error");
    }
  }

  String getInputCode() {
    String tempCode = '';
    for (int i = 0; i < 6; i++) {
      tempCode += _controllers[i].text;
    }
    return tempCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          './assets/images/landing-bg.png', // Path to your SVG
          fit: BoxFit.cover, // Cover the entire container
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      6,
                      (index) => Expanded(
                          child: VerificationInput(
                              focusnode: _focusNodes[index],
                              controller: _controllers[index])))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        checkCode();
                      },
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text('Confirm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Georgia')),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0x1AFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius here
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                resendCode();
              },
              child: this._isLoading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 5,
                    )
                  : Text(
                      'Resend Code',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Georgia'),
                    ),
            )
          ],
        ))
      ],
    ));
  }
}
