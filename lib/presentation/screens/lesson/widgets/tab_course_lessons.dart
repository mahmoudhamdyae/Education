import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/lesson/controller/lesson_controller.dart';
import 'package:education/presentation/widgets/lessons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabCourseLessons extends StatelessWidget {

  final bool isUserLoggedIn = Get.find<AuthController>().isUserLoggedIn();
  TabCourseLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LessonsWidget(wehdat: Get.find<LessonController>().wehdat, isInLessonScreen: true,),
    );
  }
}
