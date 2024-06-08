import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/application/services/app_service.dart';
import 'package:selecao_app/src/common_widgets/drawer_layout.dart';
import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/presentation/login_screen.dart';
import 'package:selecao_app/src/utils/zipcode_pt_br_formatter.dart';

class AddressSearchScreen extends StatefulWidget {
  const AddressSearchScreen({super.key});

  static const route = "/address";

  @override
  State<AddressSearchScreen> createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _zipcodeController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _zipcodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Endereços',
          style: AppTheme.title,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await AppService.instance.terminate();
              if (context.mounted) context.go(LoginScreen.route);
            },
            icon: const Icon(Icons.logout),
            iconSize: 26,
          )
        ],
      ),
      drawer: const DrawerLayout(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  _zipcodeInput(),
                  ElevatedButton(onPressed: () {}, child: const Text("Buscar")),
                ],
              ),
              Row(
                children: [
                  // _addressInput(),
                  // _addressInput(),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Filtrar")),
                ],
              ),
            ],
          ),
        ),
      ),
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
