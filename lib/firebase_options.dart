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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5h8115dEyaJGDqZCvH8uUrgqil2w-OoM',
    appId: '1:622230474242:android:4629d7ad96340fd4cea11b',
    messagingSenderId: '622230474242',
    projectId: 'panico-ee295',
    databaseURL: 'https://panico-ee295-default-rtdb.firebaseio.com',
    storageBucket: 'panico-ee295.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0aPuRqXqktkpqnWit00nTOVsbBFgIXrY',
    appId: '1:622230474242:ios:bf9dc24512180294cea11b',
    messagingSenderId: '622230474242',
    projectId: 'panico-ee295',
    databaseURL: 'https://panico-ee295-default-rtdb.firebaseio.com',
    storageBucket: 'panico-ee295.appspot.com',
    iosClientId: '622230474242-3sfqnig32bcmobgvvb972ct9esoorh17.apps.googleusercontent.com',
    iosBundleId: 'com.example.panicButtonV2',
  );
}