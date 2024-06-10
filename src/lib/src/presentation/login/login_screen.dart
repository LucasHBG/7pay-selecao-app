import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:selecao_app/src/common_widgets/form_input_decorator.dart';
import 'package:selecao_app/src/common_widgets/loading_spinner_widget.dart';
import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/application/services/app_service.dart';
import 'package:selecao_app/src/constants/visual_file_components.dart';
import 'package:selecao_app/src/domain/user_model.dart';
import 'package:selecao_app/src/presentation/home/home_screen.dart';

import 'package:selecao_app/src/utils/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const route = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _showPassword = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: Center(
                child: Text(
                  '7Pay',
                  style: AppTheme.headerBlackTitle,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("E-mail:", style: AppTheme.title),
                const SizedBox(height: 10),
                _emailInput(),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Senha:", style: AppTheme.title),
                const SizedBox(height: 10),
                _passwordInput(),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(const Size(60, 60)),
                textStyle: WidgetStateProperty.all(AppTheme.buttonLabel),
              ),
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });

                // Create fake loading time
                Future.delayed(const Duration(seconds: 2), () {
                  // Set user data with default name to simplify the project
                  AppService.instance.setUserData(UserModel(
                    uuid: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: "Lucas H",
                    email: _emailController.text,
                    password: _passwordController.text,
                  ));
                  context.go(HomeScreen.route);
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: AppTheme.buttonLabel,
                  ),
                  if (_isLoading) const SizedBox(width: 15),
                  if (_isLoading)
                    const SizedBox(
                      height: 15,
                      width: 15,
                      child: LoadingSpinnerWidget(),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SizedBox(
                height: 200,
                child: SvgPicture.asset(paymentExchangeSVG),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    /// Pode ser uma entrada do tipo E-mail ou Login de acordo com a API
    return TextFormField(
      controller: _emailController,
      enabled: _isLoading ? false : true,
      keyboardType: TextInputType.text,
      autofillHints: const [AutofillHints.email, AutofillHints.username],
      onSaved: (value) =>
          value != null ? _emailController.text = value.trim() : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O campo não pode estar vazio';
        }

        if (!value.isValidEmail() && !value.isValidLogin()) {
          return 'E-mail ou usuário inválido';
        }

        return null;
      },
      decoration: inputForm(hintText: "Insira e-mail"),
    );
  } //end widget

  Widget _passwordInput() {
    return TextFormField(
      controller: _passwordController,
      enabled: _isLoading ? false : true,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      onSaved: (value) =>
          value != null ? _passwordController.text = value.trim() : null,
      validator: (value) => value == null || value.isEmpty
          ? 'O campo não pode estar vazio'
          : null,
      obscureText: _showPassword ? false : true,
      decoration: inputForm(
        hintText: "******",
        suffixIcon: IconButton(
          icon: Icon(
            _showPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
    );
  } //end widget
}
