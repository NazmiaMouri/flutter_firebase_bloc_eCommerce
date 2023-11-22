import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/toast.dart';
import 'package:tap_debouncer/tap_debouncer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  
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
                  if (password.text == confirmPassword.text) {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                     Navigator.pushNamed(context, '/loginWithEmail');
                  } else {
                    ShowToast.errorToast('Password and confirm password is not identical');
                  }

                 
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    ShowToast.errorToast('Password should be at least 6 characters');
                  } else if (e.code == 'email-already-in-use') {
                    ShowToast.errorToast('The account already exists for that email.');
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
