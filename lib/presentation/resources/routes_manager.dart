import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/login_screen.dart';
import 'package:education/presentation/screens/main_screen.dart';
import 'package:education/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(child: Text(AppStrings.noRouteFound)),
        ));
  }
}
