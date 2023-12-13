import 'package:flutter/material.dart';

import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/strings_manager.dart';

class HomeUI {
  String name;
  String icon;
  Function(String, String) action;

  HomeUI(this.name, this.icon, this.action);

  static getItems(BuildContext context) {
    return [
      HomeUI(
        AppStrings.recordedCourses,
        ImageAssets.recordedCourses, (String marhala, String saff) {
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.recordedCoursesRoute, arguments: [marhala, saff]);
          },
      ),
      HomeUI(
        AppStrings.printedNotes,
        ImageAssets.printedNotes, (String marhala, String saff) =>
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.printedNotesRoute),
      ),
      HomeUI(
        AppStrings.courses,
        ImageAssets.courses, (String marhala, String saff) =>
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.coursesRoute),
      ),
      HomeUI(
        AppStrings.onlineCourses,
        ImageAssets.onlineCourses, (String marhala, String saff) =>
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.onlineCoursesRoute),
      ),
      HomeUI(
        AppStrings.teacher,
        ImageAssets.teacher, (String marhala, String saff) =>
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.teacherRoute),
      ),
      HomeUI(
        AppStrings.examsAndBanks,
        ImageAssets.exam, (String marhala, String saff) =>
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.examsAndBanksRoute),
      ),

    ];
  }
}