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
    apiKey: 'AIzaSyBHzv1DOZjnzWw6CkbZQxRju-4EsBT0TZk',
    appId: '1:445595166584:web:27e705db49873cfd224a8d',
    messagingSenderId: '445595166584',
    projectId: 'taskmanager-498c5',
    authDomain: 'taskmanager-498c5.firebaseapp.com',
    storageBucket: 'taskmanager-498c5.appspot.com',
    measurementId: 'G-93KL3ZCK5E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEDp3cX7cJrBNfyxQTeuFVdziBiX1p16s',
    appId: '1:445595166584:android:2d19aa25517289df224a8d',
    messagingSenderId: '445595166584',
    projectId: 'taskmanager-498c5',
    storageBucket: 'taskmanager-498c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmXtLVDuw2Sx-IUvgWqLLSjH_MY-9yq8A',
    appId: '1:445595166584:ios:0ff4f22e78f98e49224a8d',
    messagingSenderId: '445595166584',
    projectId: 'taskmanager-498c5',
    storageBucket: 'taskmanager-498c5.appspot.com',
    iosBundleId: 'com.example.toDo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmXtLVDuw2Sx-IUvgWqLLSjH_MY-9yq8A',
    appId: '1:445595166584:ios:3a39382ffdd8a6a5224a8d',
    messagingSenderId: '445595166584',
    projectId: 'taskmanager-498c5',
    storageBucket: 'taskmanager-498c5.appspot.com',
    iosBundleId: 'com.example.toDo.RunnerTests',
  );
}