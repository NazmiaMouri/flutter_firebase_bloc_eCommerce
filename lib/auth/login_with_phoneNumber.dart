// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/auth/otp.dart';
import 'package:flutter_firebase_ecommerce/widgets/debug_print.dart';

class LoginWithPhoneNumber extends StatelessWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneNumber = TextEditingController();
    final TextEditingController password = TextEditingController();



    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                      DebugPrint("+88" + phoneNumber.text);
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: "+88" + phoneNumber.text,
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (_) => OTPScreen(verificationId: verificationId),
                          ));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: Text(
                      'Send code',
                    )),
               
              ],
            ),
          ]
        ),
      ),
    );
  }
}
