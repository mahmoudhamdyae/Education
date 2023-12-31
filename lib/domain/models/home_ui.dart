import 'package:education/presentation/screens/home/courses/courses_screen.dart';
import 'package:education/presentation/screens/home/exams_and_banks/exams_and_banks_screen.dart';
import 'package:education/presentation/screens/home/online_courses/online_courses_screen.dart';
import 'package:education/presentation/screens/home/printed_notes/printed_notes_screen.dart';
import 'package:education/presentation/screens/home/recorded_courses/widgets/recorded_courses_screen.dart';
import 'package:education/presentation/screens/home/teacher/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_prefs.dart';
import '../../core/di.dart';
import '../../presentation/resources/assets_manager.dart';
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
        ImageAssets.recordedCourses, (String marhala, String saff) =>
          Get.to(() => const RecordedCoursesScreen(), arguments: { 'saff': saff }),
      ),
      HomeUI(
        AppStrings.printedNotes,
        ImageAssets.printedNotes, (String marhala, String saff) =>
          Get.to(PrintedNotesScreen(saff: saff))
      ),
      HomeUI(
        AppStrings.courses,
        ImageAssets.courses, (String marhala, String saff) =>
          Get.to(const CoursesScreen())
      ),
      HomeUI(
        AppStrings.onlineCourses,
        ImageAssets.onlineCourses, (String marhala, String saff) =>
          Get.to(const OnlineCoursesScreen())
      ),
      HomeUI(
        AppStrings.teacher,
        ImageAssets.teacher, (String marhala, String saff) async {
        final AppPreferences appPreferences = instance<AppPreferences>();
        if (await appPreferences.isUserLoggedIn()) {
          Get.to(const TeacherScreen());
        } else {
          if (context.mounted) showRequireAuthDialog(context);
        }
      }
      ),
      HomeUI(
        AppStrings.examsAndBanks,
        ImageAssets.exam, (String marhala, String saff) =>
          Get.to(ExamsAndBanksScreen(saff: saff))
      ),
    ];
  }
}