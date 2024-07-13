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
    apiKey: 'AIzaSyC1IgOPXyGvuk9buKkngAFYNuckfTqLgXg',
    appId: '1:642986490979:web:587eb379af3681af9b4c56',
    messagingSenderId: '642986490979',
    projectId: 'todo-app-for-crew',
    authDomain: 'todo-app-for-crew.firebaseapp.com',
    storageBucket: 'todo-app-for-crew.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNaUXNzk_lUj6W4qvmIyN1KjtFw4nXBLI',
    appId: '1:642986490979:android:69ef9f337c0ab8089b4c56',
    messagingSenderId: '642986490979',
    projectId: 'todo-app-for-crew',
    storageBucket: 'todo-app-for-crew.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmDzFObqg3sx5f5E-CCmeWWAwMBB67AfE',
    appId: '1:642986490979:ios:0a7a0ba05993aebe9b4c56',
    messagingSenderId: '642986490979',
    projectId: 'todo-app-for-crew',
    storageBucket: 'todo-app-for-crew.appspot.com',
    iosBundleId: 'com.example.firebasesesh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmDzFObqg3sx5f5E-CCmeWWAwMBB67AfE',
    appId: '1:642986490979:ios:96a314ac91816f879b4c56',
    messagingSenderId: '642986490979',
    projectId: 'todo-app-for-crew',
    storageBucket: 'todo-app-for-crew.appspot.com',
    iosBundleId: 'com.example.firebasesesh.RunnerTests',
  );
}