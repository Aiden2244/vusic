import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC0VCaHPtOKGPjl9aE2GXNjbARK7fMkiGo",
            authDomain: "vusic-final-c44ec.firebaseapp.com",
            projectId: "vusic-final-c44ec",
            storageBucket: "vusic-final-c44ec.appspot.com",
            messagingSenderId: "138094580765",
            appId: "1:138094580765:web:6582af4cd90420464c62f4",
            measurementId: "G-BFK5E7B1GK"));
  } else {
    await Firebase.initializeApp();
  }
}
