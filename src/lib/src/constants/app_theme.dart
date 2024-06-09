import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color lightText = Color(0xFF4A6572);
  static const Color disabledText = Color(0xFF767676);

  static const Color itemPrimaryBackground = Color(0xFFC67C4E);
  static const Color itemSecondaryBackground =
      Color.fromRGBO(237, 237, 237, 35);
  static const Color appLightBackground = Color(0xFFF9F9F9);
  static const Color textPrimaryColor = Color(0xFF313131);
  static const Color textSubtitlePrimaryColor = Color(0xFFA2A2A2);

  static Color inputBackgroundColor = const Color(0xFFCCD6E0).withOpacity(0.2);

  static const String fontFamilyName = 'Sora';

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
    color: textSubtitlePrimaryColor,
  );

  static const TextStyle inputLabel = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0,
    color: textSubtitlePrimaryColor,
  );

  static const TextStyle listItemText = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0,
    color: textPrimaryColor,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0,
    color: Color(0xFFF7F9FA),
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0,
    color: textPrimaryColor,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    letterSpacing: 0,
    color: textPrimaryColor,
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
    fontSize: 32.0,
    letterSpacing: 0,
    color: textPrimaryColor,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w400,
    fontSize: 19,
    letterSpacing: 0,
    color: textSubtitlePrimaryColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w500,
    fontSize: 9,
    letterSpacing: 0,
    color: textSubtitlePrimaryColor,
  );

  static const TextStyle chipBlackText = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 13,
    letterSpacing: 0,
    color: textSubtitlePrimaryColor,
  );

  static const TextStyle chipWhiteText = TextStyle(
    fontFamily: fontFamilyName,
    fontWeight: FontWeight.w700,
    fontSize: 13,
    letterSpacing: 0,
    color: Colors.white,
  );
}
