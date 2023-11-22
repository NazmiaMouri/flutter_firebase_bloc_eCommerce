import 'package:flutter_firebase_ecommerce/view/auth/login_with_email.dart';
import 'package:flutter_firebase_ecommerce/view/auth/login_with_phoneNumber.dart';
import 'package:flutter_firebase_ecommerce/view/auth/register.dart';
import 'package:flutter_firebase_ecommerce/view/home/home.dart';

final namedRoutes = {
  '/loginWithEmail': (context) => const LoginWithEmail(),
  '/loginWithPhone': (context) => const LoginWithPhoneNumber(),
  '/register': (context) => const Register(),
  '/home': (context) => const Home(),
};
