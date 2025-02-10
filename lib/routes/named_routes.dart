

import 'package:flutter_firebase_ecommerce/view/auth/login_with_email.dart';
import 'package:flutter_firebase_ecommerce/view/auth/login_with_phoneNumber.dart';
import 'package:flutter_firebase_ecommerce/view/auth/register.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/address.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/edit_address.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/orders.dart';
import 'package:flutter_firebase_ecommerce/view/drawer_items/wishlist.dart';
import 'package:flutter_firebase_ecommerce/view/home/home.dart';
import 'package:flutter_firebase_ecommerce/view/initial_screen/splash_screen.dart';
import 'package:flutter_firebase_ecommerce/view/initial_screen/startup_screen.dart';
import 'package:flutter_firebase_ecommerce/view/product_details/product_details.dart';

final namedRoutes = {
  '/splash': (context) => const SplashScreen(),
  '/startup': (context) => const StartUpScreen(),
  '/loginWithEmail': (context) => const LoginWithEmail(),
  '/loginWithPhone': (context) => const LoginWithPhoneNumber(),
  '/register': (context) => const Register(),
  '/home': (context) => const Home(),
  '/productDetail':(context) => const ViewProductDetail(),
  '/order':(context)=> const Orders(),
  '/wishlist':(context)=> const Wishlist(),
  '/address':(context)=> const Address(),
  '/editAddress':(context)=> const EditAddress()
};
