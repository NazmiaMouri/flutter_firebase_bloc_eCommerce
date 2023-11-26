import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/outlined_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/brand.jpg"),
        fit: BoxFit.fill,
      )),
      child: Column(
        children: [
          const AspectRatio(aspectRatio: 0.6),
          outLinedButton(
            context: context,
            buttonName: 'SHOP NOW',
            buttonColour: Colors.black,
            buttonAction: ()=>Navigator.pushNamed(context, '/startup')
          )
        ],
      ),
    );
  }
}
