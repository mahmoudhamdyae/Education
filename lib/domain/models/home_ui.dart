import 'package:flutter/material.dart';

import '../../core/app_prefs.dart';
import '../../core/di.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/widgets/dialogs/require_auth_dialog.dart';

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
        ImageAssets.printedNotes, (String marhala, String saff) {
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.printedNotesRoute, arguments: [marhala, saff]);
        }
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
        ImageAssets.teacher, (String marhala, String saff) async {
        final AppPreferences appPreferences = instance<AppPreferences>();
        if (await appPreferences.isUserLoggedIn()) {
          if (context.mounted) Navigator.of(context, rootNavigator: true).pushNamed(Routes.teacherRoute);
        } else {
          if (context.mounted) showRequireAuthDialog(context);
        }
      }
      ),
      HomeUI(
        AppStrings.examsAndBanks,
        ImageAssets.exam, (String marhala, String saff) {
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.examsAndBanksRoute, arguments: [marhala, saff]);
        }
      ),
    ];
  }
}