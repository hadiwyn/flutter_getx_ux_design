// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBdCqFBr6wPJWEJsgkr4EKsEkrnXh2QcBI',
    appId: '1:372629795840:web:abfea2e491dba295e894e5',
    messagingSenderId: '372629795840',
    projectId: 'flutter-find-my-stuff-651a5',
    authDomain: 'flutter-find-my-stuff-651a5.firebaseapp.com',
    storageBucket: 'flutter-find-my-stuff-651a5.appspot.com',
    measurementId: 'G-LT0RGLCD8S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgnMWtzEDmOiQHJufttx-lQKPOtYcUdeY',
    appId: '1:372629795840:android:040d6faef0d7104ce894e5',
    messagingSenderId: '372629795840',
    projectId: 'flutter-find-my-stuff-651a5',
    storageBucket: 'flutter-find-my-stuff-651a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC85Au0LvK5T7_XHTsSfEDLt3Lppg_QWM8',
    appId: '1:372629795840:ios:fc230391fc7b58b4e894e5',
    messagingSenderId: '372629795840',
    projectId: 'flutter-find-my-stuff-651a5',
    storageBucket: 'flutter-find-my-stuff-651a5.appspot.com',
    iosClientId: '372629795840-82c4l2v8a12veo17avuglre8031u8or6.apps.googleusercontent.com',
    iosBundleId: 'com.getxuxdesign.flutterGetxUx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC85Au0LvK5T7_XHTsSfEDLt3Lppg_QWM8',
    appId: '1:372629795840:ios:fc230391fc7b58b4e894e5',
    messagingSenderId: '372629795840',
    projectId: 'flutter-find-my-stuff-651a5',
    storageBucket: 'flutter-find-my-stuff-651a5.appspot.com',
    iosClientId: '372629795840-82c4l2v8a12veo17avuglre8031u8or6.apps.googleusercontent.com',
    iosBundleId: 'com.getxuxdesign.flutterGetxUx',
  );
}
