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
    apiKey: 'AIzaSyDPzxxnLtzmBnzfk_Buxkjb87matif91yU',
    appId: '1:276633921744:web:24744c454dcb4f4802d6d5',
    messagingSenderId: '276633921744',
    projectId: 'authapp-754bc',
    authDomain: 'authapp-754bc.firebaseapp.com',
    storageBucket: 'authapp-754bc.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD58ijbgKGzd2uZz9TRxEtTnzIts1N5OGU',
    appId: '1:276633921744:android:d22b8189d1e4700e02d6d5',
    messagingSenderId: '276633921744',
    projectId: 'authapp-754bc',
    storageBucket: 'authapp-754bc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkCt9xvMua91ARUbsFX6SVdemE-FOAEt4',
    appId: '1:276633921744:ios:30d9c920277d767a02d6d5',
    messagingSenderId: '276633921744',
    projectId: 'authapp-754bc',
    storageBucket: 'authapp-754bc.firebasestorage.app',
    iosBundleId: 'com.example.testapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkCt9xvMua91ARUbsFX6SVdemE-FOAEt4',
    appId: '1:276633921744:ios:30d9c920277d767a02d6d5',
    messagingSenderId: '276633921744',
    projectId: 'authapp-754bc',
    storageBucket: 'authapp-754bc.firebasestorage.app',
    iosBundleId: 'com.example.testapp',
  );
}
