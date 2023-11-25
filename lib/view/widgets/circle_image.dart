import 'package:flutter/material.dart';

class CircularImageWithBackground extends StatelessWidget {
  CircularImageWithBackground({
    Key? key,
    this.backgroundImageURL = 'lib/assets/images/desktop.png',
    required this.foregroundImageURL,
    this.width= 80,
    this.height= 80,
  }) : super(key: key);
  String backgroundImageURL;
  String foregroundImageURL;
  double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(backgroundImageURL), // Replace with your background image path
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          image: DecorationImage(
            image: NetworkImage(
              foregroundImageURL,
              // headers: prefManager.httpHeaders,
            ), // Replace with your foreground image path
            fit: BoxFit.cover,
          ), // Replace with your foreground image path
        ),
      ),
    );
  }
}