import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/constants/app_keys.dart';
import 'package:selecao_app/src/domain/user_model.dart';
import 'package:selecao_app/src/presentation/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Service to manage authentication
class AppService extends ChangeNotifier {
  // Empty constructor
  AppService._();

  factory AppService() => _instance;

  static AppService get instance => _instance;
  static final AppService _instance = AppService._();

  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentContext!;

  UserModel? currentUser;

  bool get isLoggedIn => currentUser != null;

  // Function to initialize with fake data
  void initialize() async {
    final preferences = await SharedPreferences.getInstance();

    final user = preferences.getString(AppKeys.userData);
    if (user != null) currentUser = UserModel.fromJson(jsonDecode(user));
  }

  void setUserData(UserModel userData) async {
    final preferences = await SharedPreferences.getInstance();

    final bool result =
        await preferences.setString(AppKeys.userData, jsonEncode(userData));

    if (!result) {
      log("Erro ao salvar informações do usuário em SharedPreferences");
    }

    currentUser = userData;
    notifyListeners();
  }

  void manageAutoLogout() {
    terminate();
    context.go(LoginScreen.route);
  }

  Future<void> terminate() async {
    currentUser = null;
  }
}
