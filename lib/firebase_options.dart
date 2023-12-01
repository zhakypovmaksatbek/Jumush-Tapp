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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAweUo7OqxpfXfS_LJYXNprClE3ocIzb7M',
    appId: '1:15674898695:web:55cb1a8f6c04b1aa9e2da2',
    messagingSenderId: '15674898695',
    projectId: 'jumush-tapp',
    authDomain: 'jumush-tapp.firebaseapp.com',
    storageBucket: 'jumush-tapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmqlGrAhC8NtIVp_M3CYKN2leVfGR4_BY',
    appId: '1:15674898695:android:9bb3800c86b9f5689e2da2',
    messagingSenderId: '15674898695',
    projectId: 'jumush-tapp',
    storageBucket: 'jumush-tapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqnGHuViYPp_oXaRMXDYlK5euV_qPE3wc',
    appId: '1:15674898695:ios:7ffcd2414fdbc1309e2da2',
    messagingSenderId: '15674898695',
    projectId: 'jumush-tapp',
    storageBucket: 'jumush-tapp.appspot.com',
    iosBundleId: 'com.maksatbek.jumushTapp',
  );
}