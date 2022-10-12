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
    apiKey: 'AIzaSyByNq-2P92h37K0YIdEMZ9tykmKy_fX7Vg',
    appId: '1:61340984943:web:e0a3bf5eea390aca34cf9a',
    messagingSenderId: '61340984943',
    projectId: 'fcm-test-147c1',
    authDomain: 'fcm-test-147c1.firebaseapp.com',
    storageBucket: 'fcm-test-147c1.appspot.com',
    measurementId: 'G-XE6QDLC3HQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsIQxLKOoo5lSwADqlDI258usFB0xtY1M',
    appId: '1:61340984943:android:97cc9fa107a7477c34cf9a',
    messagingSenderId: '61340984943',
    projectId: 'fcm-test-147c1',
    storageBucket: 'fcm-test-147c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4aw_uwk7r_fgn6XcejcrCoVRbO77o9rU',
    appId: '1:61340984943:ios:86ecafd327bada9f34cf9a',
    messagingSenderId: '61340984943',
    projectId: 'fcm-test-147c1',
    storageBucket: 'fcm-test-147c1.appspot.com',
    iosClientId: '61340984943-pmi1d5g3cou4rdrhk7tbr77ionau5g7p.apps.googleusercontent.com',
    iosBundleId: 'com.example.goAi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4aw_uwk7r_fgn6XcejcrCoVRbO77o9rU',
    appId: '1:61340984943:ios:86ecafd327bada9f34cf9a',
    messagingSenderId: '61340984943',
    projectId: 'fcm-test-147c1',
    storageBucket: 'fcm-test-147c1.appspot.com',
    iosClientId: '61340984943-pmi1d5g3cou4rdrhk7tbr77ionau5g7p.apps.googleusercontent.com',
    iosBundleId: 'com.example.goAi',
  );
}