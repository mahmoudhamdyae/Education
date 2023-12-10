import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

class RecordedCoursesScreen extends StatelessWidget {
  const RecordedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.recordedCourses),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: const Center(child: Text(AppStrings.recordedCourses),),
    );
  }
}
