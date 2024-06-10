import 'package:flutter/services.dart';

class ZipcodePtBrFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // verifica o tamanho máximo do campo
    if (newValue.text.length > 8) return oldValue;

    String newText = newValue.text;

    if (newText.length > 5 && !newText.contains("-")) {
      newText = "${newText.substring(0, 5)}-${newText.substring(5)}";
    }

    return newValue.copyWith(
        text: newText,
        selection: newValue.selection.copyWith(
          baseOffset: newText.length,
          extentOffset: newText.length,
        ));
  }
}
