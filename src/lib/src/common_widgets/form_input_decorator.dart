import 'package:flutter/material.dart';

import '../constants/app_theme.dart';

InputDecoration inputForm({
  String? hintText,
  Widget? prefix,
  String? prefixText,
  Widget? prefixIcon,
  Widget? suffix,
  String? suffixText,
  Widget? suffixIcon,
  String? helperText,
}) {
  return InputDecoration(
    fillColor: AppTheme.appLightBackground,
    filled: false,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.disabledText, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textPrimaryColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF242424), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    helperText: helperText,
    hintText: hintText,
    hintStyle: AppTheme.inputLabel,
    prefix: prefix,
    prefixText: prefixText,
    prefixIcon: prefixIcon,
    suffix: suffix,
    suffixText: suffixText,
    suffixIcon: suffixIcon,
  );
}
