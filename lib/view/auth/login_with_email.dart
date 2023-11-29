import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/debug_print.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/toast.dart';
import 'package:flutter_firebase_ecommerce/view_model/firebase/user_data_handle.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  void signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      DebugPrint("Signed in with temporary account.   $userCredential");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          DebugPrint("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          DebugPrint('Unknown error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    List<String> images = [
      'assets/images/lime_blue_blur.png',
      'assets/images/masterd_blue_blur.png',
      'assets/images/mustard _blur.png'
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 80,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/needle.png',
                    ),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: brandText(
                            text: 'Al - Maequl',
                            style:
                                TextStyle(fontSize: 24, color: brandTextolor)),
                      ),
                      malabisCollectionText(fontSize: 8)
                    ],
                  )),
              CarouselSlider(
                options: CarouselOptions(height: 300.0, autoPlay: true),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        i,
                        fit: BoxFit.fill,
                      );
                    },
                  );
                }).toList(),
              ),
              brandText(
                  text: 'Shop With Us',
                  style: TextStyle(fontSize: 24,)),
              TextField(
                controller: email,
                
                decoration:  InputDecoration(hintText: 'Enter your email', label:aText(text: 'Email address', style: TextStyle(font) ) ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(hintText: 'Enter password'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text);
                      if (!context.mounted) return;
                      getUserDetail(email.text);
                      Navigator.pushNamed(context, '/home');
                    } on FirebaseAuthException catch (e) {
                      DebugPrint(e.code);
                      if (e.code == 'user-not-found') {
                        ShowToast.errorToast('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        ShowToast.errorToast(
                            'Wrong password provided for that user.');
                      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                        ShowToast.errorToast('INVALID LOGIN CREDENTIALS');
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                  )),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: const Text(
                    'Register',
                  )),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/loginWithPhone'),
                child: const Text(
                  'Forget password? Login with OTP',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              InkWell(
                onTap: () => signInAnonymously(),
                child: const Text(
                  'Login Anonymously',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
