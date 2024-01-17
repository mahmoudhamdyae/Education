import 'package:education/core/get_x_di.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/presentation/resources/theme_manager.dart';
import 'package:education/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(CourseAdapter())
    ..registerAdapter(LessonAdapter());
  await GetXDi().dependencies();
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
