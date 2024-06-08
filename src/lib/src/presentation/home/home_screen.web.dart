import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selecao_app/src/application/services/app_service.dart';

import '../login_screen.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
          actions: [
            IconButton(
              onPressed: () async {
                await AppService.instance.terminate();
                if (context.mounted) context.go(LoginScreen.route);
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(color: Colors.grey),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                      'Login WEB do ${AppService.instance.currentUser?.name}'),
                ),
              ),
            ),
          ],
        ));
  }
}
