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
    apiKey: 'AIzaSyB1-7s5x6t7yS3Duk_DasVjZ5btvOihXeQ',
    appId: '1:853733478493:web:3779aae81c8a4e89b6bdb4',
    messagingSenderId: '853733478493',
    projectId: 'news-9fbdb',
    authDomain: 'news-9fbdb.firebaseapp.com',
    databaseURL: 'https://news-9fbdb-default-rtdb.firebaseio.com',
    storageBucket: 'news-9fbdb.appspot.com',
    measurementId: 'G-R0W67SQN4V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJgPQ_z9wHCG3DYIWfLN_aKv6dHiSw_SA',
    appId: '1:853733478493:android:f185f2751018d11bb6bdb4',
    messagingSenderId: '853733478493',
    projectId: 'news-9fbdb',
    databaseURL: 'https://news-9fbdb-default-rtdb.firebaseio.com',
    storageBucket: 'news-9fbdb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2ebFhdwOZ34BliX7poBL8V1XlXZ6Wavk',
    appId: '1:853733478493:ios:2a389606dd3dff2bb6bdb4',
    messagingSenderId: '853733478493',
    projectId: 'news-9fbdb',
    databaseURL: 'https://news-9fbdb-default-rtdb.firebaseio.com',
    storageBucket: 'news-9fbdb.appspot.com',
    iosBundleId: 'com.example.breakingNews',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2ebFhdwOZ34BliX7poBL8V1XlXZ6Wavk',
    appId: '1:853733478493:ios:52fe20db328e3aa9b6bdb4',
    messagingSenderId: '853733478493',
    projectId: 'news-9fbdb',
    databaseURL: 'https://news-9fbdb-default-rtdb.firebaseio.com',
    storageBucket: 'news-9fbdb.appspot.com',
    iosBundleId: 'com.example.breakingNews.RunnerTests',
  );
}
