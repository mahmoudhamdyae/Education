import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/lesson/controller/lesson_controller.dart';
import 'package:education/presentation/widgets/lessons_widgets.dart';
import 'package:education/presentation/widgets/save_video_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../resources/styles_manager.dart';

class TabCourseLessons extends StatelessWidget {

  final bool isUserLoggedIn = Get.find<AuthController>().isUserLoggedIn();
  TabCourseLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          // GetX<LessonController>(
          //   init: Get.find<LessonController>(),
          //   builder: (LessonController controller) {
          //     return
                LessonsWidget(wehdat: Get.find<LessonController>().wehdat, isInLessonScreen: false,),
          //     ;
          //   },
          // ),
          isUserLoggedIn ? Container():  Container(
            color: const Color(0x00000000),
            height: 80.0,
          ),
          isUserLoggedIn ? Container() : Container(
            margin: const EdgeInsets.only(top: 80.0),
            color: const Color(0x11000000),
          ),
          // Lock icon
          const Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Icon(
                Icons.lock,
                color: ColorManager.white,
                size: 72,
              )
          )
        ],
      ),
    );
  }
}
