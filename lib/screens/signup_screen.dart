// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:faith_mobile/core/routes/app_route.gr.dart';
import 'package:faith_mobile/widgets/inputForm_item.dart';
import 'package:faith_mobile/widgets/social_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:faith_mobile/core/auth/signUp.dart';

@RoutePage()
class SignupSceen extends StatefulWidget {
  const SignupSceen({Key? key}) : super(key: key);

  @override
  _SignupSceenState createState() => _SignupSceenState();
}

class _SignupSceenState extends State<SignupSceen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isChecked = false;

  String? _errorMessage;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 42),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'faith',
                        style: TextStyle(
                          fontFamily: 'faith_font',
                          color: Colors.white,
                          fontSize: 50,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w100,
                          height: 2.644,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0), // x, y offset
                              blurRadius: 10.0, // How blurred is the shadow
                              color: Color(0xF6D59DB0), // Shadow color
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      margin: EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.5),
                                    child: Text(
                                      'Create to your account',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        height: 1.07,
                                        fontFamily: 'Georgia',
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.start,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.5),
                                    child: Text(
                                      'Welcome to Faith!',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        height: 1.136,
                                        fontFamily: 'Georgia',
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.start,
                                    )),
                              ],
                            ),

                            // Name input field
                            InputFormItem(
                              controller: _nameController,
                              hintTxt: "Name...",
                              leadingIco: Icon(
                                Icons.person_outline,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),

                            // Email input field
                            InputFormItem(
                              controller: _emailController,
                              hintTxt: "Email...",
                              leadingIco: Icon(
                                Icons.email_outlined,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            // Password input field
                            InputFormItem(
                                controller: _passwordController,
                                hintTxt: "Password...",
                                keyboardType: TextInputType.visiblePassword,
                                leadingIco: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white.withOpacity(0.8),
                                )),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: this._isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = !_isChecked;
                                    });
                                  },
                                  activeColor: Colors.white.withOpacity(0.3),
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                      color: Colors.white.withOpacity(0.3),
                                      width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _isChecked = !_isChecked;
                                      });
                                    },
                                    child: Text(
                                      'I agree to the Terms and Conditions',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontFamily: 'Georgia',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 1.0,
                                  ))),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'or',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 1.0,
                                  ))),
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SocialIconButton(
                                        iconUrl: 'assets/icons/google-icon.png',
                                      ),
                                      SocialIconButton(
                                          iconUrl:
                                              'assets/icons/apple-icon.png'),
                                      SocialIconButton(
                                          iconUrl:
                                              'assets/icons/facebook-icon.png')
                                    ],
                                  ),
                                ))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 64),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: this._isChecked
                                          ? () {
                                              signUpUser(_emailController.text,
                                                  _passwordController.text);
                                            }
                                          : null,
                                      child: SizedBox(
                                        height: 40,
                                        child: Center(
                                          child: Text('Create Account',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  decoration:
                                                      TextDecoration.none,
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
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 25, top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an account?',
                                      style: TextStyle(
                                          color: Color(0xB2FFFFFF),
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Georgia')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        context.router.push(LoginScreen());
                                      },
                                      child: Text('Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Georgia')))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
