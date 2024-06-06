import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/features/login/presentation/login_screen.dart';
import 'package:selecao_app/src/services/app_service.dart';
import 'package:selecao_app/src/features/address_finder/presentation/address_form/home_screen.dart';

part 'redirection.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: AppService.instance,
  navigatorKey: AppService.instance.navigatorKey,
  initialLocation: "/",
  routes: <GoRoute>[
    GoRoute(
      path: "/",
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: LoginScreen.route,
      pageBuilder: (context, state) => const MaterialPage(child: LoginScreen()),
    ),
    GoRoute(
      path: HomeScreen.route,
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
  ],
);
