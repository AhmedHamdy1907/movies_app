import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyC_uRtHUtcWOBMSSf__h_1hjBbLFSBSHzg",
        appId: "com.example.movies_app",
        messagingSenderId: "",
        projectId: "news-app-fbe7e"
    ),
  );
  runApp(const MyApp());
}