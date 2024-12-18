import 'package:auto_route/auto_route.dart';
import 'package:myfriendfaith/core/routes/app_route.gr.dart';
import 'package:myfriendfaith/widgets/snackbars/state_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<void> signInFirebaseWithCredential(OAuthCredential credential,
    [BuildContext? context, String? photoURL]) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  final User? user = userCredential.user;
  if (user != null) {
    if (userCredential.additionalUserInfo?.isNewUser == true) {
      print("New user Signed Up with social");
    } else {
      print("User Signed In with social");
    }
    if (photoURL != null && user.photoURL == null) {
      user.updatePhotoURL(photoURL);
    }
    context!.router.push(DashboardScreen(displayName: user.displayName));
    print("User ID: ${user.uid}");
    print("User Email: ${user.email}");
    print("User Display Name: ${user.displayName}");
    return null;
  }
}

Future<User?> signInWithGoogle(BuildContext context) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    //Initialize Google Sign-In
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      print('Google Sign-In canceled by user.');
      return null;
    }

    //Obtain authentication detials
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    //Create a credential for Firebase
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    //Sign in with Firebase
    await signInFirebaseWithCredential(
        credential, context, googleUser.photoUrl);
  } catch (e) {
    print("Error during Google sign-in : $e");
    showStateSnackBar(context,
        'Sorry Unexpected error has occured. Please try again later', 'error');
    return null;
  }
}

Future<void> signInWithApple() async {
  try {
    //Request Credentials from Apple
    final AuthorizationCredentialAppleID appleCredential =
        await SignInWithApple.getAppleIDCredential(
            scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
            webAuthenticationOptions: WebAuthenticationOptions(
                clientId: "com.faithmobile.faithmobile",
                redirectUri: Uri.parse(
                    'https://my-friend-faith-fcaf1.firebaseapp.com/__/auth/handler')));

    //Create an OAuth Credential for Ifrebase
    final OAuthCredential credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode);
    await signInFirebaseWithCredential(credential);
  } catch (e) {
    print("Error during Apple Sign-in: $e");
  }
}
