import 'package:flutter/material.dart';
import 'package:selecao_app/src/presentation/home/home_screen.mobile.dart';
import 'package:selecao_app/src/presentation/home/home_screen.web.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const route = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return const HomeScreenMobile();
    }

    return const HomeScreenWeb();
  }
}
