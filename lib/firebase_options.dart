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
    apiKey: 'AIzaSyA4W-Ws_66CUCW9z0sixIG5Y3T_C5ideio',
    appId: '1:585680400602:web:e607c77e0d902ec4b335e3',
    messagingSenderId: '585680400602',
    projectId: 'initvideodatabase',
    authDomain: 'initvideodatabase.firebaseapp.com',
    storageBucket: 'initvideodatabase.appspot.com',
    measurementId: 'G-LD05R7D8WY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWcmJL2VTL0Q5Bj8W2yL8bOQkIAh_gCOU',
    appId: '1:585680400602:android:32b74065a1532bdeb335e3',
    messagingSenderId: '585680400602',
    projectId: 'initvideodatabase',
    storageBucket: 'initvideodatabase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoCUKs9G1v2a7MMVPFbl3vVZ-gGXatyuw',
    appId: '1:585680400602:ios:42e28729de359591b335e3',
    messagingSenderId: '585680400602',
    projectId: 'initvideodatabase',
    storageBucket: 'initvideodatabase.appspot.com',
    iosBundleId: 'com.example.defendorAppV01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDoCUKs9G1v2a7MMVPFbl3vVZ-gGXatyuw',
    appId: '1:585680400602:ios:3a9da683671e486db335e3',
    messagingSenderId: '585680400602',
    projectId: 'initvideodatabase',
    storageBucket: 'initvideodatabase.appspot.com',
    iosBundleId: 'com.example.defendorAppV01.RunnerTests',
  );
}
