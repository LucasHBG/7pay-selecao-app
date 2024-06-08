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
    fillColor: const Color(0xFFCCD6E0).withOpacity(0.2),
    filled: true,
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE4E4E4), width: 1),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1),
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
