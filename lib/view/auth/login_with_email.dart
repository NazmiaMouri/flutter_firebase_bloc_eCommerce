import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/debug_print.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/toast.dart';
import 'package:flutter_firebase_ecommerce/view_model/firebase/user_data_handle.dart';

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
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AspectRatio(
              aspectRatio: 16 / 6,
              child: SizedBox(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: email,
                  decoration:
                      const InputDecoration(hintText: 'Enter your email'),
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
