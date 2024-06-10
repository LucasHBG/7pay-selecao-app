import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';

import 'package:selecao_app/src/application/services/address_service.dart';
import 'package:selecao_app/src/application/services/app_service.dart';
import 'package:selecao_app/src/common_widgets/custom_snackbar.dart';
import 'package:selecao_app/src/common_widgets/drawer_layout.dart';
import 'package:selecao_app/src/common_widgets/form_input_decorator.dart';
import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/domain/viacep_data_store.dart';
import 'package:selecao_app/src/presentation/address_search/address_card_widget.dart';
import 'package:selecao_app/src/presentation/login/login_screen.dart';
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
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final ViacepDataStore viacepDataStore = ViacepDataStore();
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
        centerTitle: true,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              direction: Axis.horizontal,
              runSpacing: 25,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CEP:",
                              style: AppTheme.listItemText,
                            ),
                            _zipcodeInput(),
                          ],
                        )),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          onPressed: () async {
                            try {
                              if (viacepDataStore.viacepDataList.isNotEmpty) {
                                final searchResult = viacepDataStore
                                    .viacepDataList
                                    .firstWhereOrNull(
                                  (item) => item.cep == _zipcodeController.text,
                                );

                                if (searchResult != null) {
                                  throw "CEP já inserido.";
                                }
                              }

                              final viacepDataObject = await AddressService()
                                  .searchZipcode(_zipcodeController.text);

                              viacepDataStore.addItemToList(viacepDataObject);
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    CustomSnackbar.buildErrorSnackBar(
                                  errorString: e.toString(),
                                ));
                              }
                            }
                          },
                          icon: const Icon(Icons.search, color: Colors.white),
                          style: IconButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            padding: const EdgeInsets.all(16),
                            backgroundColor: AppTheme.itemPrimaryBackground,
                            side: const BorderSide(
                              width: 1,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Bairro:",
                            style: AppTheme.listItemText,
                          ),
                          const SizedBox(height: 5),
                          _streetAddressInput(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cidade:",
                            style: AppTheme.listItemText,
                          ),
                          const SizedBox(height: 5),
                          _cityInput(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Filtrar",
                          style: AppTheme.buttonLabel,
                        ),
                      ),
                    ),
                  ],
                ),
                Observer(builder: (_) {
                  return AddressCardWidget(
                    addressList: viacepDataStore.viacepDataList.toList(),
                  );
                })
              ],
            ),
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
      decoration: inputForm(hintText: "00000-000"),
    );
  } //end widget

  Widget _streetAddressInput() {
    /// Pode ser uma entrada do tipo E-mail ou Login de acordo com a API
    return TextFormField(
      controller: _streetAddressController,
      enabled: _isLoading ? false : true,
      keyboardType: TextInputType.text,
      onSaved: (value) =>
          value != null ? _streetAddressController.text = value.trim() : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O campo não pode estar vazio';
        }

        if (value.length >= 8) {
          return 'Bairro inválido';
        }

        return null;
      },
      decoration: inputForm(hintText: "Vila Nova"),
    );
  } //end widget

  Widget _cityInput() {
    /// Pode ser uma entrada do tipo E-mail ou Login de acordo com a API
    return TextFormField(
      controller: _cityController,
      enabled: _isLoading ? false : true,
      keyboardType: TextInputType.text,
      onSaved: (value) =>
          value != null ? _cityController.text = value.trim() : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O campo não pode estar vazio';
        }

        if (value.length >= 8) {
          return 'UF inválido';
        }

        return null;
      },
      decoration: inputForm(hintText: "GO"),
    );
  } //end widget
}
