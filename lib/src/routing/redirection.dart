part of 'router.dart';

// Function to redirect user when not meeting requirements
String? _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn = AppService.instance.isLoggedIn;
  final isLoginRoute = state.matchedLocation == LoginScreen.route;

  if (!isLoggedIn && !isLoginRoute) {
    return LoginScreen.route;
  } else if (isLoggedIn && isLoginRoute) {
    return HomeScreen.route;
  }

  return null;
}
