import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/home/courses/courses_screen.dart';
import 'package:education/presentation/screens/home/exams_and_banks/exams_and_banks_screen.dart';
import 'package:education/presentation/screens/home/home_screen.dart';
import 'package:education/presentation/screens/auth/login_screen.dart';
import 'package:education/presentation/screens/home/online_courses/online_courses_screen.dart';
import 'package:education/presentation/screens/home/printed_notes/printed_notes_screen.dart';
import 'package:education/presentation/screens/home/subject/widgets/subject_screen.dart';
import 'package:education/presentation/screens/home/teacher/teacher_screen.dart';
import 'package:education/presentation/screens/main_screen.dart';
import 'package:education/presentation/screens/start/start_screen.dart';
import 'package:flutter/material.dart';
import '../../domain/models/courses/course.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/recorded_courses/widgets/recorded_courses_screen.dart';
import '../screens/lesson/lesson_screen.dart';
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
  static const String subjectRoute = "/subject";
  static const String lessonRoute = "/lesson";
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
        return MaterialPageRoute(builder: (_) => ExamsAndBanksScreen(parameters: settings.arguments as List<String>,));
      case Routes.onlineCoursesRoute:
        return MaterialPageRoute(builder: (_) => const OnlineCoursesScreen());
      case Routes.printedNotesRoute:
        return MaterialPageRoute(builder: (_) => PrintedNotesScreen(parameters: settings.arguments as List<String>,));
      case Routes.recordedCoursesRoute:
        return MaterialPageRoute(builder: (_) => RecordedCoursesScreen(parameters: settings.arguments as List<String>,));
      case Routes.teacherRoute:
        return MaterialPageRoute(builder: (_) => const TeacherScreen());
      case Routes.subjectRoute:
        return MaterialPageRoute(builder: (_) => SubjectScreen(course: settings.arguments as Course));
      case Routes.lessonRoute:
        return MaterialPageRoute(builder: (_) => LessonScreen(parameters: settings.arguments as List<dynamic>,));
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
