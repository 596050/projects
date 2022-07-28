import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
    
    // appBarTheme: appBarTheme,
    // iconTheme: const IconThemeData(color: kContentColorLightTheme),
    // textTheme: TextTheme()
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: kContentColorLightTheme,
      secondary: kPrimaryColor,
      error: kErrorColor,
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: kPrimaryColor,
    //   selectedItemColor: kContentColorLightTheme,
    //   selectedIconTheme: IconThemeData(
    //     color: kContentColorLightTheme,
    //   ),
    //   unselectedItemColor: kPrimaryColor,
    //   showUnselectedLabels: false,
    // ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: true, elevation: 0);
