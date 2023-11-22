import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  final verificationId;

  const OTPScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return Pinput(
      onCompleted: (pin) async {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: pin);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
    );
  }
}
