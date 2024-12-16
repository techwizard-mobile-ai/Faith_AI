// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:myfriendfaith/core/auth/signIn.dart';
import 'package:myfriendfaith/core/auth/social_Sign.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';
import 'package:myfriendfaith/widgets/inputForm_item.dart';
import 'package:myfriendfaith/widgets/social_icon_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool progressLogin = false;

  //Handle Click the Login Button
  Future<void> _handleLogin(BuildContext context) async {
    await SiginInWithEmail(
        _emailController.text, _passwordController.text, context);
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
                      margin: EdgeInsets.only(top: 56),
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
                                      'Login to your account',
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
                                      'Welcome back to Faith!',
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forget password?',
                                      style: TextStyle(
                                        color: Colors.white,
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
                                        onPressed: () async {
                                          if (progressLogin) return;
                                          setState(() {
                                            progressLogin = true;
                                          });
                                          await signInWithGoogle(context);
                                          setState(() {
                                            progressLogin = false;
                                          });
                                        },
                                        iconUrl: 'assets/icons/google-icon.png',
                                      ),
                                      SocialIconButton(
                                          onPressed: () {},
                                          iconUrl:
                                              'assets/icons/apple-icon.png'),
                                      SocialIconButton(
                                          onPressed: () {},
                                          iconUrl:
                                              'assets/icons/facebook-icon.png')
                                    ],
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ))),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: progressLogin
                                ? null
                                : () {
                                    _handleLogin(context);
                                  },
                            child: progressLogin
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : SizedBox(
                                    height: 40,
                                    child: Center(
                                      child: Text('Login',
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 25, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No accoutn yet?',
                            style: TextStyle(
                                color: Color(0xB2FFFFFF),
                                fontSize: 14,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Georgia')),
                        TextButton(
                            onPressed: progressLogin
                                ? null
                                : () {
                                    Navigator.pop(context);
                                    context.router.push(SignupSceen());
                                  },
                            child: Text('Sign Up',
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
              )
            ],
          )
        ],
      ),
    );
  }
}
