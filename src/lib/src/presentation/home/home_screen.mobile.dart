import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/application/services/app_service.dart';
import 'package:selecao_app/src/common_widgets/drawer_layout.dart';
import 'package:selecao_app/src/constants/app_theme.dart';

import '../login_screen.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '7Pay',
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
      body: Center(
        child: Text(
            'Tela MOBILE do usuário: ${AppService.instance.currentUser?.name}'),
      ),
    );
  }
}
