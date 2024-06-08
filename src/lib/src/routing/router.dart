import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/presentation/address_search/address_search_screen.dart';
import 'package:selecao_app/src/presentation/home/home_screen.dart';
import 'package:selecao_app/src/presentation/login_screen.dart';
import 'package:selecao_app/src/application/services/app_service.dart';

part 'redirection.dart';

final router = GoRouter(
  redirect: _redirect,
  debugLogDiagnostics: true,
  refreshListenable: AppService.instance,
  navigatorKey: AppService.instance.navigatorKey,
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
    GoRoute(
      path: AddressSearchScreen.route,
      pageBuilder: (context, state) =>
          const MaterialPage(child: AddressSearchScreen()),
    ),
  ],
);
