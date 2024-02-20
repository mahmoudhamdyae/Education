import 'package:education/presentation/screens/home/exams/widgets/exams_screen.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/printed_notes_screen.dart';
import 'package:education/presentation/screens/home/recorded_courses/widgets/recorded_courses_screen.dart';
import 'package:education/presentation/widgets/dialogs/soon_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/strings_manager.dart';

class HomeUI {
  String name;
  String icon;
  Function(String, String, String) action;

  HomeUI(this.name, this.icon, this.action);

  static getItems(BuildContext context) {
    return [
      HomeUI(
        AppStrings.recordedCourses,
        ImageAssets.home1, (String marhala, String saff, String term) =>
          Get.to(() => const RecordedCoursesScreen(), arguments: { 'saff': saff }),
      ),
      HomeUI(
        AppStrings.printedNotes,
        ImageAssets.home2, (String marhala, String saff, String term) =>
          Get.to(const PrintedNotesScreen(), arguments: { 'saff': saff })
      ),
      HomeUI(
        AppStrings.courses,
        ImageAssets.home3, (String marhala, String saff, String term) {
          showSoonDialog(context);
        }
      ),
      HomeUI(
        AppStrings.onlineCourses,
        ImageAssets.home4, (String marhala, String saff, String term) {
        showSoonDialog(context);
        }
      ),
      HomeUI(
        AppStrings.teacher,
        ImageAssets.home5, (String marhala, String saff, String term) async {
        showSoonDialog(context);
      }
      ),
      HomeUI(
        AppStrings.examsAndBanks,
        ImageAssets.home6, (String marhala, String saff, String term) =>
          Get.to(() => const ExamsScreen(), arguments: { 'saff': saff, 'term': term })
      ),
    ];
  }
}