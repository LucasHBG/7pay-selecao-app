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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: AppTheme.itemPrimaryBackground,
                              radius: 42,
                              child: Icon(
                                Icons.person,
                                size: 32,
                                color: AppTheme.appLightBackground,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Nome: ${AppService.instance.currentUser?.name ?? "não disponível."}",
                          style: AppTheme.listItemText,
                        ),
                        const SizedBox(height: 10),
                        if (AppService.instance.currentUser != null &&
                            AppService.instance.currentUser?.email != null)
                          Text(
                            "E-mail: ${AppService.instance.currentUser!.email.isEmpty ? "não disponível." : AppService.instance.currentUser!.email}",
                            style: AppTheme.listItemText,
                          ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Divider(
                      thickness: 0.5,
                      color: AppTheme.textPrimaryColor,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Início",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () => context.go(HomeScreen.route),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.credit_card,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Endereços",
                      style: AppTheme.listItemText,
                    ),
                    onTap: () => context.go(AddressSearchScreen.route),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.monetization_on_outlined,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Finanças",
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
                    leading: const Icon(
                      Icons.access_time,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Link de pagamento",
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
                    leading: const Icon(
                      Icons.featured_play_list_sharp,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Emitissão NF-E",
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
                    leading: const Icon(
                      Icons.signal_cellular_alt,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Rendimentos",
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
                    leading: const Icon(
                      Icons.pie_chart,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Gastos",
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
                    leading: const Icon(
                      Icons.scatter_plot_outlined,
                      color: AppTheme.itemPrimaryBackground,
                    ),
                    title: const Text(
                      "Aplicações",
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
