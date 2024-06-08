import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/common_widgets/form_input_decorator.dart';
import 'package:selecao_app/src/common_widgets/loading_spinner_widget.dart';
import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/application/services/app_service.dart';
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Login to your account',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          _emailInput(),
          const SizedBox(height: 16),
          _passwordInput(),
          const SizedBox(height: 20),
          ElevatedButton(
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
              children: [
                const Text('Login'),
                if (_isLoading) const LoadingSpinnerWidget()
              ],
            ),
          )
        ],
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
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 248, 248, 248),
        filled: true,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        hintText: "******",
        hintStyle: AppTheme.inputLabel,
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
