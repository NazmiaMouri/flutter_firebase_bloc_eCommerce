import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/outlined_button.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/lady_sewing.png"),
          )),
      child: Column(children: [
        const Text('BRAND NAME'),
        const SizedBox(
          height: 100,
        ),
        const Text(' Fashion is not luxury anymore '),
        const SizedBox(
          height: 30,
        ),
        const Text('Lower toxic world Lower toxic world Lower toxic world '),
        const SizedBox(
          height: 30,
        ),
        outLinedButton(context: context, buttonName: 'Login', buttonColour: Colors.black, buttonAction: ()),
        const SizedBox(
          height: 20,
        ),
        filledButton(context: context, buttonName: 'Register', buttonColour: Colors.black, buttonAction: ())
      ]),
    );
  }
}
