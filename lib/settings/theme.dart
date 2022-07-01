import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData ligthTheme = ThemeData(
    primaryColor: const Color(0xFF202645),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: "NotoSansDisplay", 
        fontWeight: FontWeight.w500, 
        fontSize: 60 
      ),
      headline2: TextStyle(
        fontFamily: "NotoSansDisplay_Condensed", 
        fontWeight: FontWeight.w400, 
        fontSize: 25 
      ),
      headline3: TextStyle(
        fontFamily: "NotoSansDisplay_SemiCondensed", 
        fontWeight: FontWeight.w500, 
        fontSize: 20 
      ),
      bodyText1: TextStyle(
        fontFamily: "NotoSansDisplay",
        fontSize: 14,
        fontWeight: FontWeight.w400
      )
    ),
  );
}
