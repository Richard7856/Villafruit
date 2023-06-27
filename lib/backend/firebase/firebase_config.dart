import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBck9RVRfGVq4vgnYEYU_M6etYsQ7EHRiY",
            authDomain: "villafruit-c6a1d.firebaseapp.com",
            projectId: "villafruit-c6a1d",
            storageBucket: "villafruit-c6a1d.appspot.com",
            messagingSenderId: "1034076506520",
            appId: "1:1034076506520:web:8cbbbaafad0dfd175e43ed",
            measurementId: "G-WE98ZYJ0Y8"));
  } else {
    await Firebase.initializeApp();
  }
}
