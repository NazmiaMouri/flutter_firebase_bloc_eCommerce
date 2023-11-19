import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userName,
              decoration: const InputDecoration(hintText: 'Enter your name'),
            ),
            TextField(
              controller: phoneNumber,
              decoration: const InputDecoration(hintText: 'Enter your phone number'),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Enter email'),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: 'Enter password'),
            ),
            TextField(
              controller: confirmPassword,
              decoration: const InputDecoration(hintText: 'Confirm password'),
            ),
            TapDebouncer(
              onTap: () async {
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  Navigator.pushNamed(context, '/loginWithEmail');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              }, // your tap handler moved here
              builder: (BuildContext context, TapDebouncerFunc? onTap) {
                return ElevatedButton(
                  onPressed: onTap, // It is just onTap from builder callback
                  child: const Text('Register'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
