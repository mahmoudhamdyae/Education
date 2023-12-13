import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

class RecordedCoursesScreen extends StatelessWidget {
  final List<String>? name;
  const RecordedCoursesScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    print('======== name $name');
    print('======== name ${name![0]}');
    print('======== name ${name![1]}');
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
