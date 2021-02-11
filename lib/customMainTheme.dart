import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getCustomTheme() {
  Color primaryColor = Color(0xFF88aa4c);
  return ThemeData(
    primaryColor: primaryColor,
    accentColor: Color(0xFFce1414),
    canvasColor: Color(0xFFfaf9f1),

    // text theme
    textTheme: TextTheme(
      headline1: GoogleFonts.aBeeZee(
        fontSize: 32,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.montserrat(
        fontSize: 22,
        color: Colors.black,
      ),
      headline3: GoogleFonts.montserrat(
        fontSize: 20,
        color: Colors.black,
      ),
      // headline6: GoogleFonts.montserrat(
      //   fontSize: 16,
      //   color: Colors.black,
      // ),
      bodyText1: GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyText2: GoogleFonts.montserrat(
        fontSize: 14,
        color: Colors.black,
      ),
      caption: GoogleFonts.montserrat(
        fontSize: 12,
        color: Colors.grey,
      ),
      subtitle1: GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.black,
      ),
      subtitle2: GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.black,
      ),
      button: GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.white,
      ),
      overline: GoogleFonts.montserrat(
        color: Colors.grey,
        fontSize: 11,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xff23d2f3),
    ),
  );
}
