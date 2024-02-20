import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/strings_manager.dart';
import '../../../../widgets/empty_screen.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../recorded_courses/widgets/recorded_courses_list.dart';
import '../controller/exams_controller.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed saff: ${Get.arguments['saff']}');
    debugPrint('passed term: ${Get.arguments['term']}');
    return Scaffold(
      body: GetX<ExamsController>(
        init: Get.find<ExamsController>(),
        builder: (ExamsController controller) {
          if (controller.status.isLoading) {
            return const LoadingScreen();
          } else if (controller.status.isError) {
            return ErrorScreen(error: controller.status.errorMessage ?? '');
          } else if (controller.courses.isEmpty){
            return const EmptyScreen(emptyString: AppStrings.noExamCourses);
          } else {
            final courses = controller.courses;
            return RecordedCoursesList(
              subjects: courses,
              title: Get.arguments['saff'] == '' ? AppStrings.recordedCourses : '${AppStrings.recordedCoursesTitleBar} ${Get.arguments['saff']}',
            );
          }
        },
      ),
    );
  }
}
