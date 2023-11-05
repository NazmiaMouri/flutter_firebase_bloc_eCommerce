import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/login/login.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.green,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool checkLoggedIn() {
    bool loggedIn = false;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        loggedIn = false;
      } else {
        loggedIn = true;
      }
    });

    return loggedIn;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: checkLoggedIn() ? Container() : Login());
  }
}
