import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selecao_app/src/utils/zipcode_pt_br_formatter.dart';

class AddressFinderScreen extends StatefulWidget {
  const AddressFinderScreen({super.key});

  static const route = "/address";

  @override
  State<AddressFinderScreen> createState() => _AddressFinderScreenState();
}

class _AddressFinderScreenState extends State<AddressFinderScreen> {
  final TextEditingController _zipcodeController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _zipcodeInput(),
            ElevatedButton(onPressed: () {}, child: const Text("Buscar")),
          ],
        ),
        Row(
          children: [
            _addressInput(),
            _addressInput(),
            ElevatedButton(onPressed: () {}, child: const Text("Filtrar")),
          ],
        ),
      ],
    );
  }

  Widget _zipcodeInput() {
    /// Pode ser uma entrada do tipo E-mail ou Login de acordo com a API
    return TextFormField(
      controller: _zipcodeController,
      enabled: _isLoading ? false : true,
      maxLength: 8,
      keyboardType: TextInputType.number,
      autofillHints: const [AutofillHints.postalCode],
      onSaved: (value) =>
          value != null ? _zipcodeController.text = value.trim() : null,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        ZipcodePtBrFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O campo não pode estar vazio';
        }

        if (value.length >= 8) {
          return 'CEP inválido';
        }

        return null;
      },
    );
  } //end widget

  Widget _addressInput() {
    /// Pode ser uma entrada do tipo E-mail ou Login de acordo com a API
    return TextFormField(
      controller: _zipcodeController,
      enabled: _isLoading ? false : true,
      keyboardType: TextInputType.text,
      onSaved: (value) =>
          value != null ? _zipcodeController.text = value.trim() : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O campo não pode estar vazio';
        }

        if (value.length >= 8) {
          return 'CEP inválido';
        }

        return null;
      },
    );
  } //end widget
}
