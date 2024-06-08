import 'package:flutter/services.dart';

class ZipcodePtBrFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // verifica o tamanho máximo do campo
    if (newValue.text.length > 8) return oldValue;

    final valorFinal = StringBuffer();
    int posicaoCursor = newValue.selection.end;

    for (int i = 0; i < newValue.text.length; i++) {
      if (i == 2) {
        valorFinal.write('.');
        if (posicaoCursor > i) posicaoCursor++;
      }
      if (i == 5) {
        valorFinal.write('-');
        if (posicaoCursor > i) posicaoCursor++;
      }
      valorFinal.write(newValue.text[i]);
    }

    return newValue.copyWith(
        text: valorFinal.toString(),
        selection: TextSelection.collapsed(offset: newValue.text.length));
  }
}
