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
    apiKey: 'AIzaSyA0M3B_1cPTeZ7QKZUGXWKapLFiRamrULA',
    appId: '1:870430773319:web:3be5dd6c3efa95ff21e162',
    messagingSenderId: '870430773319',
    projectId: 'hoseo-meet-7918f',
    authDomain: 'hoseo-meet-7918f.firebaseapp.com',
    storageBucket: 'hoseo-meet-7918f.appspot.com',
    measurementId: 'G-KJFXNG2RZ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBngyzB0A_C-jYN7pptuoblJCgAw7-Zqag',
    appId: '1:870430773319:android:6e968ac313e809b421e162',
    messagingSenderId: '870430773319',
    projectId: 'hoseo-meet-7918f',
    storageBucket: 'hoseo-meet-7918f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8DPybQS4F9F8sPVG6wOmgo0PR4cLJJZE',
    appId: '1:870430773319:ios:08f2aa9a67371c7721e162',
    messagingSenderId: '870430773319',
    projectId: 'hoseo-meet-7918f',
    storageBucket: 'hoseo-meet-7918f.appspot.com',
    iosBundleId: 'com.example.hoseomeet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8DPybQS4F9F8sPVG6wOmgo0PR4cLJJZE',
    appId: '1:870430773319:ios:08f2aa9a67371c7721e162',
    messagingSenderId: '870430773319',
    projectId: 'hoseo-meet-7918f',
    storageBucket: 'hoseo-meet-7918f.appspot.com',
    iosBundleId: 'com.example.hoseomeet',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA0M3B_1cPTeZ7QKZUGXWKapLFiRamrULA',
    appId: '1:870430773319:web:8dd2a21a50acdc3d21e162',
    messagingSenderId: '870430773319',
    projectId: 'hoseo-meet-7918f',
    authDomain: 'hoseo-meet-7918f.firebaseapp.com',
    storageBucket: 'hoseo-meet-7918f.appspot.com',
    measurementId: 'G-4MH45G9ERS',
  );
}
