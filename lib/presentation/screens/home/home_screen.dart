import 'package:education/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';
import '../../widgets/custom_grid_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> _stringsList = [
    AppStrings.recordedCourses,
    AppStrings.printedNotes,
    AppStrings.courses,
    AppStrings.onlineCourses,
    AppStrings.teacher,
    AppStrings.examsAndBanks,
  ];

  final List<IconData> _iconsList = [
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    final actions = [
          () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.recordedCoursesRoute),
          () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.printedNotesRoute),
          () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.coursesRoute),
          () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.onlineCoursesRoute),
          () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.teacherRoute),
          () => Navigator.of(context, rootNavigator: true).pushNamed(Routes.examsAndBanksRoute),
    ];
    return CustomGridView(_stringsList, _iconsList, actions);
  }
}
