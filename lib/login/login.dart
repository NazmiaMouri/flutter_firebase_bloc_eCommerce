// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/widgets/debug_print.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneNumber = TextEditingController();
    final TextEditingController password = TextEditingController();

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

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 16 / 6,
              child: SizedBox(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneNumber,
                  decoration: InputDecoration(hintText: 'Enter your phone number'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: "+88" + phoneNumber.text,
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {},
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: Text(
                      'Send code',
                    )),
                ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'Register',
                    )),
              ],
            ),
            InkWell(
              onTap: () => signInAnonymously(),
              child: Text(
                'Login Anonymously',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
