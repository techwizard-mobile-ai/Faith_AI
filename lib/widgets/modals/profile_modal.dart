// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfriendfaith/core/auth/delete.dart';
import 'package:myfriendfaith/core/auth/signOut.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myfriendfaith/core/storage/avatars.dart';
import 'dart:io';

import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';

@RoutePage()
class ProfileModal extends StatefulWidget {
  const ProfileModal({Key? key}) : super(key: key);

  @override
  _ProfileModalState createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
  User? user;
  bool isEditing = false;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//For Saving the Edit Result
//Users can click the Edit Button
//Theb they can be able to edit the display name and email , password and photos.
  void handleEdit_Save() {
    if (!this.isEditing) {
      setState(() {
        this.isEditing = true;
      });
      return;
    } else {
      updateProfile(context);
    }
  }

//Here is for the update chnages

//Upload Profile image and update the photoURL of the firebase authentication
  Future<void> updateProfile(BuildContext context) async {
    String? imageURL;

    if (imageFile != null && user != null) {
      imageURL = await uploadAvatar(imageFile, user?.uid ?? '');
      if (imageURL != null) {
        user?.updatePhotoURL(imageURL);
        showStateSnackBar(context, 'Profile Image Uploaded', 'success');
      } else {
        showStateSnackBar(context, 'Profile Image Upload Failed', 'error');
      }
      await user?.updateDisplayName(_nameController.text);
      await user?.updatePassword(_passwordController.text);
      await user?.reload();
      showStateSnackBar(context, 'Profile Upldated SuccessFully', 'success');
    }
  }

//For the Image Picker from the gallery of from the camera
  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

//This is for the when the user who is logged in or not logged in
//If the user is not logged in, the user will be redirected to the login screen for the signin
//If the user is logged in, the user will be redirected to the home screen after logged out
  void handleSignIn_Out(BuildContext context) {
    if (user == null) {
      context.router.push(LoginScreen());
      return;
    }
    signOut(context);
  }

//This is for deleting the user account
  void handleDeleteAccount(BuildContext context) {
    deleteAccount(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _nameController.text = user!.displayName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
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
                  margin: EdgeInsets.only(top: 32),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() => {this.isEditing = true});
                                  },
                                  icon: Icon(this.isEditing
                                      ? Icons.check
                                      : Icons.edit_note_rounded),
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 150),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15, left: 10),
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Playfair',
                                  fontWeight: FontWeight.bold,
                                  height: 1.7,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                children: [
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: user?.photoURL != null
                                          ? ClipOval(
                                              child: Image(
                                                image: NetworkImage(
                                                    user!.photoURL!),
                                              ),
                                            )
                                          : Icon(
                                              Icons.account_circle,
                                              color: Colors.white,
                                              size: 50,
                                            )),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          user?.email ?? "Faith",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )),
                                  this.isEditing
                                      ? IconButton(
                                          onPressed: () {
                                            pickImage();
                                          },
                                          iconSize: 22,
                                          icon: Icon(
                                            Icons.upload,
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ))
                                      : SizedBox.shrink()
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 1),
                                      )),
                                      child: TextField(
                                          controller: _nameController,
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          enabled: this.isEditing,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: 'Name',
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: 'Georgia',
                                                height: 1.741,
                                                fontSize: 14),
                                            border: InputBorder.none,
                                          ))),
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            width: 1),
                                      )),
                                      child: TextField(
                                          controller: _passwordController,
                                          style: TextStyle(color: Colors.white),
                                          enabled: this.isEditing,
                                          cursorColor: Colors.white,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: 'New Password',
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: 'Georgia',
                                                height: 1.741,
                                                fontSize: 14),
                                            border: InputBorder.none,
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextButton(
                              onPressed: () {
                                handleDeleteAccount(context);
                              },
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 13),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                'Delete My Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Georgia',
                                    height: 1.741,
                                    fontSize: 14),
                              ),
                            ),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(top: 12),
                            child: TextButton(
                              onPressed: () {
                                handleSignIn_Out(context);
                              },
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 13),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                this.user == null ? 'Log In' : 'Log Out',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Georgia',
                                    height: 1.741,
                                    fontSize: 14),
                              ),
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
