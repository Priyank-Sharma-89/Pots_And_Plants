import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getCustomTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.nunito().fontFamily,
    primaryColor: Color(0xFF88aa4c),
    accentColor: Color(0xFFce1414),
    canvasColor: Color(0xFFfaf9f1),
  );
}
