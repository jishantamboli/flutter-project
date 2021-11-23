import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        //elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      )
    );

  static ThemeData WhiteTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
      );

  //colors
  static Color creamcolor = Color(0xff5f5f5);
  static Color darkBlueshColor = Color(0xff403b50);
}
