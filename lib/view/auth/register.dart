import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FocusNode userNameNode = FocusNode();
  FocusNode phoneNumberNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode addressNode = FocusNode();

  final TextEditingController userName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: brand),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: brand,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get's started with",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/needle.png',
                            ),
                          )),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                           
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: brandText(
                                    text: 'Al - Maequl', style: TextStyle(fontSize: 24, color: brandTextolor)),
                              ),
                              malabisCollectionText(fontSize: 8)
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          // TextField(
          //   controller: userName,
          //   focusNode: userNameNode,
          //   decoration: const InputDecoration(hintText: 'Enter your name'),
          // ),
          // TextField(
          //   controller: phoneNumber,
          //   focusNode: phoneNumberNode,
          //   decoration: const InputDecoration(hintText: 'Enter your phone number'),
          // ),
          // TextField(
          //   controller: email,
          //   focusNode: emailNode,
          //   decoration: const InputDecoration(hintText: 'Enter email'),
          // ),
          // TextField(
          //   controller: password,
          //   focusNode: passwordNode,
          //   decoration: const InputDecoration(hintText: 'Enter password'),
          // ),
          // TextField(
          //   controller: confirmPassword,
          //   focusNode: confirmPasswordNode,
          //   decoration: const InputDecoration(hintText: 'Confirm password'),
          // ),
          // TapDebouncer(
          //   onTap: () async {
          //     try {
          //       if (password.text == confirmPassword.text) {
          //         final resp = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //           email: email.text,
          //           password: password.text,
          //         );
          //         User user = User(
          //           name: userName.text,
          //           email: email.text,
          //           phoneNumber: phoneNumber.text,
          //         );
          //         DebugPrint(resp);
          //         createUserCollection(user);

          //         if (!context.mounted) return;
          //         Navigator.pushNamed(context, '/loginWithEmail');
          //       } else {
          //         ShowToast.errorToast('Password and confirm password is not identical');
          //       }
          //     } on FirebaseAuthException catch (e) {
          //       if (e.code == 'weak-password') {
          //         ShowToast.errorToast('Password should be at least 6 characters');
          //       } else if (e.code == 'email-already-in-use') {
          //         ShowToast.errorToast('The account already exists for that email.');
          //       }
          //     } catch (e) {
          //       print(e);
          //     }
          //   }, // your tap handler moved here
          //   builder: (BuildContext context, TapDebouncerFunc? onTap) {
          //     return ElevatedButton(
          //       onPressed: onTap, // It is just onTap from builder callback
          //       child: const Text('Register'),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
