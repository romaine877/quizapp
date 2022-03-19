import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  fontFamily: GoogleFonts.ubuntu().fontFamily,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black87,
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 40, color: Colors.green),
    bodyText2: TextStyle(fontSize: 16),
    button: TextStyle(
      letterSpacing: 1.5,
      fontSize: 20,
    ),
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    subtitle1: TextStyle(
      color: Colors.grey,
    ),
  ),
  buttonTheme: const ButtonThemeData(),
);
