import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_grid_view.dart';


class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<String> _stringsList = [
    AppStrings.onlineCourses,
    AppStrings.examsAndBanks,
    AppStrings.notes,
    AppStrings.recordedCourses,
  ];

  final List<IconData> _iconsList = [
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: CustomGridView(_stringsList, _iconsList),
    );
  }
}
