import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:selecao_app/src/application/services/app_service.dart';
import 'package:selecao_app/src/common_widgets/custom_snackbar.dart';
import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/presentation/address_search/address_search_screen.dart';
import 'package:selecao_app/src/presentation/home/home_screen.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      child: Drawer(
        elevation: 1,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nome: ${AppService.instance.currentUser?.name ?? "não disponível."}",
                        ),
                        if (AppService.instance.currentUser != null &&
                            AppService.instance.currentUser?.email != null)
                          Text(
                            "E-mail: ${AppService.instance.currentUser!.email.isEmpty ? "não disponível." : AppService.instance.currentUser!.email}",
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text(
                      "Início",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () => context.go(HomeScreen.route),
                  ),
                  ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: const Text(
                      "Endereços",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () => context.go(AddressSearchScreen.route),
                  ),
                  ListTile(
                    leading: const Icon(Icons.monetization_on_outlined),
                    title: const Text(
                      "A1",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () {
                      context.pop();
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackbar.buildErrorSnackBar(
                          errorString: "Tela não implementada.",
                          errorDuration: 5,
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: const Text(
                      "A2",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () {
                      context.pop();
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackbar.buildErrorSnackBar(
                          errorString: "Tela não implementada.",
                          errorDuration: 5,
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.featured_play_list_sharp),
                    title: const Text(
                      "A3",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () {
                      context.pop();
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackbar.buildErrorSnackBar(
                          errorString: "Tela não implementada.",
                          errorDuration: 5,
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.signal_cellular_alt),
                    title: const Text(
                      "A4",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () {
                      context.pop();
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackbar.buildErrorSnackBar(
                          errorString: "Tela não implementada.",
                          errorDuration: 5,
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.pie_chart),
                    title: const Text(
                      "A5",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () {
                      context.pop();
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackbar.buildErrorSnackBar(
                          errorString: "Tela não implementada.",
                          errorDuration: 5,
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.scatter_plot_outlined),
                    title: const Text(
                      "A6",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () {
                      context.pop();
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackbar.buildErrorSnackBar(
                          errorString: "Tela não implementada.",
                          errorDuration: 5,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text(
                "@ ${DateTime.now().year} 7Pay LTDA",
                style: AppTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}
