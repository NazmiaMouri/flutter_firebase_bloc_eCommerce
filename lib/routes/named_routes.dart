import 'package:flutter_firebase_ecommerce/view/auth/login_with_email.dart';
import 'package:flutter_firebase_ecommerce/view/auth/login_with_phoneNumber.dart';
import 'package:flutter_firebase_ecommerce/view/auth/register.dart';
import 'package:flutter_firebase_ecommerce/view/home/home.dart';
import 'package:flutter_firebase_ecommerce/view/splash.dart/splash_screen.dart';
import 'package:flutter_firebase_ecommerce/view/splash.dart/startup_screen.dart';

final namedRoutes = {
  '/splash': (context) => const SplashScreen(),
  '/startup': (context) => const StartUpScreen(),
  '/loginWithEmail': (context) => const LoginWithEmail(),
  '/loginWithPhone': (context) => const LoginWithPhoneNumber(),
  '/register': (context) => const Register(),
  '/home': (context) => const Home(),
};
