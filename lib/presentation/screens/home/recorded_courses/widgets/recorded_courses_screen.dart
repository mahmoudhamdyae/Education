import 'package:education/core/di.dart';
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
  
  final List<String>? parameters;
  late final RecordedCoursesController _controller = instance<RecordedCoursesController>();

  RecordedCoursesScreen({super.key, required this.parameters});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed marhala: ${parameters![0]}');
    debugPrint('passed saff: ${parameters![1]}');
    _controller.getRecordedCourses(parameters![1]);
    return Scaffold(
      appBar: AppBar(
        title: Text(parameters![1] == '' ? AppStrings.recordedCourses : '${AppStrings.recordedCoursesTitleBar} ${parameters![1]}'),
        leading: IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const LoadingScreen();
        } else if (_controller.error.value != '') {
          return ErrorScreen(error: _controller.error.value);
        } else if (_controller.classModel.value.courses.isEmpty){
          return const EmptyScreen(emptyString: AppStrings.noCourses);
        } else {
          final classModel = _controller.classModel.value;
          return RecordedCoursesScreenBody(classModel: classModel);
        }
      }),
    );
  }
}
