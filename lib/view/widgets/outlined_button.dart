import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';

Widget outLinedButton(
    {required BuildContext context,
    required buttonName,
    required Color buttonColour,
    required buttonAction,
    double? height,
    double? width}) {
  return SizedBox(
    height: height ?? 50,
    width: width ?? MediaQuery.of(context).size.width * 0.50,
    child: OutlinedButton(
        onPressed: () {
          buttonAction();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 2.0, color: buttonColour),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
           buttonName,
          style: TextStyle(fontSize: 18, color: buttonColour),
        )),
  );
}
