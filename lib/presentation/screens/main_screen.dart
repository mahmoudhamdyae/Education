import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_grid_view.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          LogOutDialog()
        ],
      ),
      body: CustomGridView(_stringsList, _iconsList),
    );
  }
}
