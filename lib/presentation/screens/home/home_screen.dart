import 'package:education/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/HomeUI.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/custom_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<HomeUI> items = [
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
    return CustomGridView(items);
  }
}
