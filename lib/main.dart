import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course/Pages/SignInPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:course/Pages/HomePage.dart';
import 'package:course/Pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA8cImvcNW0RTdNOccb8m7cTBLPtBt7fb4",
            authDomain: "fluttercourse-62a5c.firebaseapp.com",
            projectId: "fluttercourse-62a5c",
            storageBucket: "fluttercourse-62a5c.appspot.com",
            messagingSenderId: "327498502446",
            appId: "1:327498502446:web:60b294d639dc4b7a89aabf"));
  } else {
    await Firebase.initializeApp();
  }
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    
  );

  runApp(const MaterialApp(
    home: SignInPage(),
    debugShowCheckedModeBanner: false,
  ));
}
