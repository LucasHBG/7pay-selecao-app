import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:selecao_app/src/constants/app_theme.dart';
import 'package:selecao_app/src/routing/router.dart';
import 'package:selecao_app/src/application/services/app_service.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //Uses the browser URL's pathname to represent Flutter's route name.
    // usePathUrlStrategy();
    usePathUrlStrategy();
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
        brightness: Brightness.light,
        highlightColor: Colors.white,
        fontFamily: AppTheme.fontFamilyName,
        scaffoldBackgroundColor: AppTheme.appLightBackground,
        appBarTheme: const AppBarTheme(color: AppTheme.appLightBackground),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white,
        ),
        buttonTheme:
            const ButtonThemeData(buttonColor: AppTheme.itemPrimaryBackground),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              AppTheme.itemPrimaryBackground,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)))),
            foregroundColor: WidgetStateProperty.all(
              Colors.white,
            ),
            backgroundColor: WidgetStateProperty.all(
              AppTheme.itemPrimaryBackground,
            ),
          ),
        ),
        useMaterial3: true,
      ),
    );
  }
}
