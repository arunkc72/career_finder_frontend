import 'package:career_finder/View/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData get lighttheme {
    return ThemeData.light().copyWith(
      primaryColor: myPrimaryColor,
      scaffoldBackgroundColor: Colors.blue.shade50,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: myLightTextColor,
          ),
          centerTitle: false,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
          )),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: GoogleFonts.rubikTextTheme().copyWith().apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
      colorScheme: const ColorScheme.light(
        primary: myPrimaryColor,
        background: myDarkTextColor,
        error: Colors.red,
      ),
    );
  }

  static ThemeData get darktheme {
    return ThemeData.dark().copyWith(
        primaryColor: myPrimaryColor,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          color: myPrimaryColor,
        ),
        iconTheme: const IconThemeData(color: myDarkTextColor),
        textTheme: GoogleFonts.rubikTextTheme().copyWith(),
        colorScheme: const ColorScheme.light(
          primary: myPrimaryColor,
          background: myLightTextColor,
          error: Colors.red,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: myLightTextColor,
            selectedItemColor: myPrimaryColor,
            unselectedItemColor: myLightTextColor,
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: myPrimaryColor)));
  }
}
