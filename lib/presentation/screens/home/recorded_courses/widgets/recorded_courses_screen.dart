import 'package:education/presentation/screens/home/recorded_courses/controller/recorded_courses_controller.dart';
import 'package:education/presentation/screens/home/recorded_courses/widgets/recorded_courses_screen_body.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';

class RecordedCoursesScreen extends StatelessWidget {

  const RecordedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed saff: ${Get.arguments['saff']}');
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['saff'] == '' ? AppStrings.recordedCourses : '${AppStrings.recordedCoursesTitleBar} ${Get.arguments['saff']}'),
        leading: IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: GetX<RecordedCoursesController>(
        init: Get.find<RecordedCoursesController>(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return const LoadingScreen();
          } else if (controller.error.value != '') {
            return ErrorScreen(error: controller.error.value);
          } else if (controller.classModel.value.courses.isEmpty){
            return const EmptyScreen(emptyString: AppStrings.noCourses);
          } else {
            final classModel = controller.classModel.value;
            return RecordedCoursesScreenBody(classModel: classModel);
          }
        },
      ),
    );
  }
}
