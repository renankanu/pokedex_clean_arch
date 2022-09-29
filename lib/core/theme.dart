import 'package:flutter/material.dart';

final ThemeData baseTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xffffffff),
  primaryColorLight: Color(0xffe6e6e6),
  primaryColorDark: Color(0xff4d4d4d),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.white)
      .copyWith(secondary: Color(0xff808080)),
);
