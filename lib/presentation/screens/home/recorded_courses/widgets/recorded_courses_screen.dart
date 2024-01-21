import 'package:education/presentation/screens/home/recorded_courses/controller/recorded_courses_controller.dart';
import 'package:education/presentation/screens/home/widgets/suggestions.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/strings_manager.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';

class RecordedCoursesScreen extends StatelessWidget {

  const RecordedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed saff: ${Get.arguments['saff']}');
    return Scaffold(
      body: GetX<RecordedCoursesController>(
        init: Get.find<RecordedCoursesController>(),
        builder: (RecordedCoursesController controller) {
          if (controller.status.isLoading) {
            return const LoadingScreen();
          } else if (controller.status.isError) {
            return ErrorScreen(error: controller.status.errorMessage ?? '');
          } else if (controller.classModel.value.courses.isEmpty){
            return const EmptyScreen(emptyString: AppStrings.noCourses);
          } else {
            final classModel = controller.classModel.value;
            return Suggestions(
              subjects: classModel.courses,
              title: Get.arguments['saff'] == '' ? AppStrings.recordedCourses : '${AppStrings.recordedCoursesTitleBar} ${Get.arguments['saff']}',
            );
          }
        },
      ),
    );
  }
}
