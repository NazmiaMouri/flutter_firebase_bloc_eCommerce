import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandText({required String text, required TextStyle style}) {
  return Text(
    text,
    style: GoogleFonts.allison(textStyle: style),
  );
}

// Widget aText({required String text,  TextStyle? style}) {
//   return Text(text, style: GoogleFonts.abhayaLibre(textStyle: style));
// }

Widget malabisCollectionText(
    {required double fontSize, double? letterSpacing}) {
  return Text(
    'MALABIS COLLECTION',
    style: GoogleFonts.arbutus(
        textStyle: TextStyle(
            color: Color(0xFFA49476),
            letterSpacing: letterSpacing ?? 5,
            fontSize: fontSize)),
  );
}
