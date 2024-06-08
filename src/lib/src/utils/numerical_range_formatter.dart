import 'package:flutter/services.dart';

/// This is a silent text limiter that restrain users from
/// tapping a value greater than the max size
/// Ex: min: 1 and max: 99.
/// User can't type a number less than 1 nor greater than 99
class NumericalRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return newValue.copyWith(text: min.toString());
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}
