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
    apiKey: 'AIzaSyDbzCYhGQS_GFEnsf6Gp5Gj9TXfk40i0V4',
    appId: '1:1065535369616:web:a77292681de197841d4315',
    messagingSenderId: '1065535369616',
    projectId: 'cartilla-online',
    authDomain: 'cartilla-online.firebaseapp.com',
    storageBucket: 'cartilla-online.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBo-vZbq-88IeW_9p_mTrBFaJT7HZv7zmY',
    appId: '1:1065535369616:android:4a6c981c63385f931d4315',
    messagingSenderId: '1065535369616',
    projectId: 'cartilla-online',
    storageBucket: 'cartilla-online.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBn488TbeUpC70E7r8SMYkXwiZow3RlYwA',
    appId: '1:1065535369616:ios:53436ce768e22a851d4315',
    messagingSenderId: '1065535369616',
    projectId: 'cartilla-online',
    storageBucket: 'cartilla-online.appspot.com',
    iosClientId: '1065535369616-2tt9vmkpcjknig5ksdikdn2om0g9k711.apps.googleusercontent.com',
    iosBundleId: 'com.example.cartillaFlutter',
  );
}
