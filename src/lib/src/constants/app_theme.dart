import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color lightText = Color(0xFF4A6572);
  static const Color disabledText = Color(0xFF767676);

  static const Color appBackground = Color(0xFFFFFFFF);
  static const Color titleTextColor = Color(0xFF3C3E41);
  static const Color primaryTextColor = Color(0xFF627282);
  static const Color darkTextColor = Color(0xFF3C3E41);
  static const Color chipWhiteColor = Color(0xFFFBFBFC);

  static Color inputBackgroundColor = const Color(0xFFCCD6E0).withOpacity(0.2);

  static const String fontFamilyName = 'OpenSans';

  static const TextTheme textTheme = TextTheme(
    displayLarge: h1,
    titleLarge: title,
    titleMedium: subtitle,
    bodyLarge: headerWhiteTitle,
    bodyMedium: body2,
    bodySmall: caption,
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: primaryTextColor,
  );

  static const TextStyle inputLabel = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle listItemText = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0,
    color: darkTextColor,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: 0,
    color: Color(0xFFF7F9FA),
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w800,
    fontSize: 30,
    letterSpacing: 0,
    color: titleTextColor,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    letterSpacing: 0,
    color: darkTextColor,
  );

  static const TextStyle headerWhiteTitle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 25.0,
    letterSpacing: 0,
    color: Colors.white,
  );

  static const TextStyle headerBlackTitle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 25.0,
    letterSpacing: 0,
    color: titleTextColor,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 19,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w500,
    fontSize: 9,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle chipBlackText = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 13,
    letterSpacing: 0,
    color: primaryTextColor,
  );

  static const TextStyle chipWhiteText = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 13,
    letterSpacing: 0,
    color: chipWhiteColor,
  );
}
