import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/routing/router.dart';
import 'package:selecao_app/src/application/services/app_service.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS || Platform.isAndroid) {
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then(
      (_) => runApp(
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: const MyAppMobile(),
        ),
      ),
    );
  }

  // Run default layout
  runApp(const MyAppWeb());
}

class MyAppWeb extends StatefulWidget {
  const MyAppWeb({super.key});

  @override
  State<MyAppWeb> createState() => _MyAppWebState();
}

class _MyAppWebState extends State<MyAppWeb> {
  @override
  void initState() {
    super.initState();
    //Uses the browser URL's pathname to represent Flutter's route name.
    // usePathUrlStrategy();
    AppService.instance.initialize();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Seleção App',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppTheme.fontFamilyName,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
        ),
        useMaterial3: true,
      ),
    );
  }
}

class MyAppMobile extends StatefulWidget {
  const MyAppMobile({super.key});

  @override
  State<MyAppMobile> createState() => _MyAppMobileState();
}

class _MyAppMobileState extends State<MyAppMobile> {
  @override
  void initState() {
    super.initState();
    AppService.instance.initialize();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Seleção App',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppTheme.fontFamilyName,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
        ),
        useMaterial3: true,
      ),
    );
  }
}
