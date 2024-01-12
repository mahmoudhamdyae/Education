import 'package:education/core/get_x_di.dart';
import 'package:education/presentation/resources/theme_manager.dart';
import 'package:education/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      home: const SplashScreen(),
      initialBinding: GetXDi(),
    );
  }
}
