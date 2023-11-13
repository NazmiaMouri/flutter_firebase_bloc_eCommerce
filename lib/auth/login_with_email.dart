import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/widgets/debug_print.dart';

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
                  controller: email,
                  decoration: InputDecoration(hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: 'Enter password'),
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(email: email.text, password: password.text);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: const Text(
                      'Login',
                    )),
                const ElevatedButton(
                    onPressed: null,
                    child: Text(
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
            )
              ],
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
    );
  }
}
