import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCA8GfWbMIcakIeoXV86iH3kOjXwyIDySI",
            authDomain: "techni-help.firebaseapp.com",
            projectId: "techni-help",
            storageBucket: "techni-help.firebasestorage.app",
            messagingSenderId: "31750112695",
            appId: "1:31750112695:web:1d93664971ccea98251432",
            measurementId: "G-4F8YWC0PK4"));
  } else {
    await Firebase.initializeApp();
  }
}
