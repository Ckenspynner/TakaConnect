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
    apiKey: 'AIzaSyCDZeO332Cj19xdyOpzmZwXE39eESWnG48',
    appId: '1:822910198054:web:4a6592d1f2a43fc635a1e7',
    messagingSenderId: '822910198054',
    projectId: 'takaconnectauth',
    authDomain: 'takaconnectauth.firebaseapp.com',
    storageBucket: 'takaconnectauth.appspot.com',
    measurementId: 'G-J0QHE5S70G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAk1D75Dbi8poRuLQIaLNlyj2ezGFvCw0g',
    appId: '1:822910198054:android:f898e2aa227b200e35a1e7',
    messagingSenderId: '822910198054',
    projectId: 'takaconnectauth',
    storageBucket: 'takaconnectauth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAhwbsA-f-dJagVKbGsiqzTvIKm8fT0bg',
    appId: '1:822910198054:ios:9fd268e177a19bbc35a1e7',
    messagingSenderId: '822910198054',
    projectId: 'takaconnectauth',
    storageBucket: 'takaconnectauth.appspot.com',
    iosBundleId: 'codespynner.io.takaconnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAhwbsA-f-dJagVKbGsiqzTvIKm8fT0bg',
    appId: '1:822910198054:ios:faa0a049768f1ea535a1e7',
    messagingSenderId: '822910198054',
    projectId: 'takaconnectauth',
    storageBucket: 'takaconnectauth.appspot.com',
    iosBundleId: 'codespynner.io.takaconnect.RunnerTests',
  );
}
