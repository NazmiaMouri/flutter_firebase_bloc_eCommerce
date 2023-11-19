import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/auth/login_with_email.dart';
import 'package:flutter_firebase_ecommerce/auth/login_with_phoneNumber.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce/auth/otp.dart';
import 'package:flutter_firebase_ecommerce/auth/register.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

final routes = {
  '/loginWithEmail': (context) => const LoginWithEmail(),
  '/loginWithPhone': (context) => const LoginWithPhoneNumber(),
  '/register':(context) => const Register(),
};

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute:checkLoggedIn() ? 'Container()' : '/loginWithEmail' ,
    );
  }
}
