import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';
import '../widgets/custom_grid_view.dart';

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
    return CustomGridView(_stringsList, _iconsList);
  }
}
