import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/home/courses/courses_screen.dart';
import 'package:education/presentation/screens/home/exams_and_banks/exams_and_banks_screen.dart';
import 'package:education/presentation/screens/home/home_screen.dart';
import 'package:education/presentation/screens/auth/login_screen.dart';
import 'package:education/presentation/screens/home/online_courses/online_courses_screen.dart';
import 'package:education/presentation/screens/home/printed_notes/printed_notes_screen.dart';
import 'package:education/presentation/screens/home/recorded_courses/recorded_courses_screen.dart';
import 'package:education/presentation/screens/home/teacher/teacher_screen.dart';
import 'package:education/presentation/screens/main_screen.dart';
import 'package:education/presentation/screens/start/start_screen.dart';
import 'package:flutter/material.dart';
import '../screens/auth/register_screen.dart';
import '../screens/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String startRoute = "/start";
  static const String mainRoute = "/main";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
  static const String coursesRoute = "/courses";
  static const String examsAndBanksRoute = "/exams_and_banks";
  static const String onlineCoursesRoute = "/online_courses";
  static const String printedNotesRoute = "/printed_notes";
  static const String recordedCoursesRoute = "/recorded_courses";
  static const String teacherRoute = "/teacher";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.coursesRoute:
        return MaterialPageRoute(builder: (_) => const CoursesScreen());
      case Routes.examsAndBanksRoute:
        return MaterialPageRoute(builder: (_) => const ExamsAndBanksScreen());
      case Routes.onlineCoursesRoute:
        return MaterialPageRoute(builder: (_) => const OnlineCoursesScreen());
      case Routes.printedNotesRoute:
        return MaterialPageRoute(builder: (_) => const PrintedNotesScreen());
      case Routes.recordedCoursesRoute:
        return MaterialPageRoute(builder: (_) => const RecordedCoursesScreen());
      case Routes.teacherRoute:
        return MaterialPageRoute(builder: (_) => const TeacherScreen());
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
