import 'package:education/presentation/resources/routes_manager.dart';
import 'package:education/presentation/resources/theme_manager.dart';
import 'package:education/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
