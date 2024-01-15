import 'package:education/presentation/screens/home/recorded_courses/controller/recorded_courses_controller.dart';
import 'package:education/presentation/screens/home/widgets/baqat.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/home_app_bar.dart';
import 'package:education/presentation/screens/home/widgets/subjects.dart';
import 'package:education/presentation/screens/home/widgets/suggestions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/strings_manager.dart';
import '../../widgets/empty_screen.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<RecordedCoursesController>().getRecordedCourses();
    return ListView(
      children: [
        HomeAppBar(),
        const Baqat(),
        GetX<RecordedCoursesController>(
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
              return Column(
                children: [
                  Subjects(subjects: classModel.courses,),
                  Suggestions(subjects: classModel.courses,),
                ],
              );
            }
        },
        ),
      ],
    );
  }
}
