import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:selecao_app/src/constants/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Service to manage authentication
class AppService extends ChangeNotifier {
  // Empty constructor
  AppService._();

  factory AppService() => _instance;

  static AppService get instance => _instance;
  static final AppService _instance = AppService._();

  final navigatorKey = GlobalKey<NavigatorState>();

  String? currentUser;

  bool get isLoggedIn => currentUser != null;

  // Function to initialize with fake data
  void initialize() async {
    final preferences = await SharedPreferences.getInstance();

    final user = preferences.getString(AppKeys.userData);
    if (user != null) currentUser = user;
  }

  Future<void> terminate() async {
    currentUser = null;
  }

  void setUserData(String userData) async {
    final preferences = await SharedPreferences.getInstance();

    final user = await preferences.setString(AppKeys.userData, userData);
    if (!user) {
      log("Erro ao salvar informações do usuário no SharedPreferences");
    }
    currentUser = userData;
    notifyListeners();
  }
}
