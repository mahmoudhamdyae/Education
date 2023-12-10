import 'package:flutter/material.dart';

import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/strings_manager.dart';

class HomeUI {
  String name;
  IconData icon;
  Function action;

  HomeUI(this.name, this.icon, this.action);

  static getItems(BuildContext context) {
    return [
      HomeUI(
        AppStrings.recordedCourses,
        Icons.person,
            () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.recordedCoursesRoute),
      ),
      HomeUI(
        AppStrings.printedNotes,
        Icons.person,
            () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.printedNotesRoute),
      ),
      HomeUI(
        AppStrings.courses,
        Icons.person,
            () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.coursesRoute),
      ),
      HomeUI(
        AppStrings.onlineCourses,
        Icons.person,
            () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.onlineCoursesRoute),
      ),
      HomeUI(
        AppStrings.teacher,
        Icons.person,
            () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.teacherRoute),
      ),
      HomeUI(
        AppStrings.examsAndBanks,
        Icons.person,
            () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.examsAndBanksRoute),
      ),

    ];
  }
}