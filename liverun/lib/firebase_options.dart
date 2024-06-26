// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return windows;
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
    apiKey: 'AIzaSyDXZYnMU64aRjo5ZOhHjZsaAc7NSk5FQFg',
    appId: '1:35967732039:web:6cae695fa56cc7c67da462',
    messagingSenderId: '35967732039',
    projectId: 'liverun-574fd',
    authDomain: 'liverun-574fd.firebaseapp.com',
    storageBucket: 'liverun-574fd.appspot.com',
    measurementId: 'G-QF8H4PWBEM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIJS_qF5LjI7411rg_2ikcfQG0zmIXQWE',
    appId: '1:35967732039:android:24543d6bba8defd67da462',
    messagingSenderId: '35967732039',
    projectId: 'liverun-574fd',
    storageBucket: 'liverun-574fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwPxbaq2jdD6_zjWgNBMtjTyIPoggbdSk',
    appId: '1:35967732039:ios:d10ec3fd1783e8d27da462',
    messagingSenderId: '35967732039',
    projectId: 'liverun-574fd',
    storageBucket: 'liverun-574fd.appspot.com',
    iosBundleId: 'com.example.liverun',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwPxbaq2jdD6_zjWgNBMtjTyIPoggbdSk',
    appId: '1:35967732039:ios:d10ec3fd1783e8d27da462',
    messagingSenderId: '35967732039',
    projectId: 'liverun-574fd',
    storageBucket: 'liverun-574fd.appspot.com',
    iosBundleId: 'com.example.liverun',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXZYnMU64aRjo5ZOhHjZsaAc7NSk5FQFg',
    appId: '1:35967732039:web:76d28c445f5c70237da462',
    messagingSenderId: '35967732039',
    projectId: 'liverun-574fd',
    authDomain: 'liverun-574fd.firebaseapp.com',
    storageBucket: 'liverun-574fd.appspot.com',
    measurementId: 'G-ZQMKYZBM7Z',
  );
}
