import 'package:flutter/material.dart';

Widget filledButton(
    {required BuildContext context,
    required buttonName,
    required Color buttonColour,
    required buttonAction,
    double? height,
    double? width}) {
  return SizedBox(
    height: height ?? 50,
    width: width ?? MediaQuery.of(context).size.width * 0.50,
    child: ElevatedButton(
        onPressed: () {
          buttonAction();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
  );
}
