import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC7cAemX9svfk4mxrJggXjeaiQ15_Kn9WQ",
            authDomain: "ecommerceflow-b77af.firebaseapp.com",
            projectId: "ecommerceflow-b77af",
            storageBucket: "ecommerceflow-b77af.appspot.com",
            messagingSenderId: "1043975006797",
            appId: "1:1043975006797:web:ee2597bca03c9e8fa8ca04",
            measurementId: "G-6GBYD0BRFB"));
  } else {
    await Firebase.initializeApp();
  }
}
