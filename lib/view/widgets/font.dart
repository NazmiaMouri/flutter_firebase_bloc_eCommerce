import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandText({required String text, required TextStyle style}) {
  return Text(
    text,
    style: GoogleFonts.allison(textStyle: style),
  );
}

Widget aText({required String text, required TextStyle style}) {
  return Text(text, style: GoogleFonts.abhayaLibre(textStyle: style..fontSize));
}

Widget malabisCollectionText({required double fontSize}) {
  return Text(
    'MALABIS COLLECTION',
    style: GoogleFonts.arbutus(
        textStyle: TextStyle(
            color: Color(0xFFA49476),
            letterSpacing: 5,
            fontSize: fontSize)),
  );
}
