import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandText({required String text, required TextStyle style}) {
  return Text(
    text,
    style: GoogleFonts.allison(textStyle: style),
  );
}
