import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/fonts.dart' as const_fonts;
import '../constants/measures.dart' as const_measures;

final ThemeData darkTheme = ThemeData(
  primaryColor: const_colors.darkPrimary,
  scaffoldBackgroundColor: const_colors.darkScaffoldBackground,
  focusColor: const_colors.darkFocus,
  shadowColor: const_colors.darkShadow,
  iconTheme: const IconThemeData(
    color: const_colors.darkPrimary,
  ),
  appBarTheme: const AppBarTheme(
    color: const_colors.darkShadow,
    centerTitle: false,
    titleSpacing: const_measures.bigHorMargin,
    titleTextStyle: TextStyle(
      fontSize: const_fonts.headline4Size,
      fontWeight: FontWeight.normal,
      color: const_colors.darkFocus,
    ),
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: const_fonts.headline4Size,
      fontWeight: FontWeight.normal,
      color: const_colors.darkFocus,
    ),
    headline5: TextStyle(
      fontSize: const_fonts.headline5Size,
      fontWeight: FontWeight.bold,
      color: const_colors.darkFocus,
    ),
    headline6: TextStyle(
      fontSize: const_fonts.headline6Size,
      fontWeight: FontWeight.normal,
      color: const_colors.darkFocus,
    ),
    bodyText1: TextStyle(
      fontSize: const_fonts.bodyText1Size,
      fontWeight: FontWeight.normal,
      color: const_colors.darkFocus,
    ),
    bodyText2: TextStyle(
      fontSize: const_fonts.bodyText2Size,
      fontWeight: FontWeight.normal,
      color: const_colors.darkFocus,
    ),
    subtitle1: TextStyle(
      fontSize: const_fonts.subtitle1Size,
      fontWeight: FontWeight.normal,
      color: const_colors.darkShadow,
    ),
    subtitle2: TextStyle(
      fontSize: const_fonts.subtitle1Size,
      fontWeight: FontWeight.bold,
      color: const_colors.darkPrimary,
    ),
  ),
);
