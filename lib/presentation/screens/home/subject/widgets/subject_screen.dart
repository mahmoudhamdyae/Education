import 'package:education/presentation/screens/home/subject/controller/subject_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/courses/course.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../widgets/empty_screen.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/lessons_widgets.dart';
import '../../../../widgets/loading_screen.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((Get.arguments['course'] as Course).name),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.white,
          ),
        ),
      ),
      body: GetX<SubjectController>(
          init: Get.find<SubjectController>(),
          builder: (controller) {
            if (controller.status.isLoading) {
              return const LoadingScreen();
            } else if (controller.status.isError) {
              return ErrorScreen(error: controller.status.errorMessage ?? '');
            } else if (controller.wehdat.isEmpty) {
              return const EmptyScreen(emptyString: AppStrings.emptyTutorials);
            } else {
              final wehdat = controller.wehdat;
              return LessonsWidget(
                wehdat: wehdat,
                isInLessonScreen: false,
              );
            }
          }),
    );
  }
}
