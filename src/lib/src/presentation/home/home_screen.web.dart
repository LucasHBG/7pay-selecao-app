import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/application/services/app_service.dart';

import '../../common_widgets/drawer_layout.dart';
import '../../constants/app_theme.dart';
import '../login/login_screen.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: const Center(
        child: Text('Tela WEB'),
      ),
    );
  }
}
