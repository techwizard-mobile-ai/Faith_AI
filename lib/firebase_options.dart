// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBkoWoEOrStUwZSQ6l5wojPmeAaWj10LQE',
    appId: '1:35240612401:web:1da583a8409c98593a3b10',
    messagingSenderId: '35240612401',
    projectId: 'my-friend-faith-fcaf1',
    authDomain: 'my-friend-faith-fcaf1.firebaseapp.com',
    storageBucket: 'my-friend-faith-fcaf1.firebasestorage.app',
    measurementId: 'G-M1H6L10385',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBLdHb9cpmI-14LS9okWK48ITA9K5M39w',
    appId: '1:35240612401:android:3170dcf27efe72fb3a3b10',
    messagingSenderId: '35240612401',
    projectId: 'my-friend-faith-fcaf1',
    storageBucket: 'my-friend-faith-fcaf1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvBTzmr-qjdYs_2OSXeEokArfs8DAEtN4',
    appId: '1:35240612401:ios:3d58543e2c37b51a3a3b10',
    messagingSenderId: '35240612401',
    projectId: 'my-friend-faith-fcaf1',
    storageBucket: 'my-friend-faith-fcaf1.firebasestorage.app',
    iosBundleId: 'com.example.faithMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBvBTzmr-qjdYs_2OSXeEokArfs8DAEtN4',
    appId: '1:35240612401:ios:3d58543e2c37b51a3a3b10',
    messagingSenderId: '35240612401',
    projectId: 'my-friend-faith-fcaf1',
    storageBucket: 'my-friend-faith-fcaf1.firebasestorage.app',
    iosBundleId: 'com.example.faithMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBkoWoEOrStUwZSQ6l5wojPmeAaWj10LQE',
    appId: '1:35240612401:web:b35e520c866724963a3b10',
    messagingSenderId: '35240612401',
    projectId: 'my-friend-faith-fcaf1',
    authDomain: 'my-friend-faith-fcaf1.firebaseapp.com',
    storageBucket: 'my-friend-faith-fcaf1.firebasestorage.app',
    measurementId: 'G-RD191CMNVN',
  );

}