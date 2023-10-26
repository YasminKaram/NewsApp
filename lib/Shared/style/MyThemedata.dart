import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Colors.dart';


class MyThemeData {

  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: blackColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: primaryColor,
          onBackground: blackColor,
          surface: primaryColor,
          onSurface: Colors.white),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: blackColor),
      ),
      scaffoldBackgroundColor:Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        color: Colors.green,
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
      ));

  static ThemeData darkTheme =  ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: blackColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: primaryColor,
          onBackground: blackColor,
          surface: primaryColor,
          onSurface: Colors.white),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 30,),
        color: Colors.green,
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
      ));
}
