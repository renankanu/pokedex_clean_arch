import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static final theme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    primaryColor: Colors.grey,
    primaryIconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.sourceSansPro(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
  );
}
