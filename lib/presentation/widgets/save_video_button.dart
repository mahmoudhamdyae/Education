import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/screens/fav/controller/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../domain/models/courses/course.dart';
import '../../domain/models/lesson/lesson.dart';
import '../resources/color_manager.dart';

class SaveVideoButton extends StatelessWidget {

  final Course course;
  final Lesson lesson;
  const SaveVideoButton({super.key, required this.course, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return GetX<VideoController>(
      init: Get.find<VideoController>(),
      builder: (VideoController controller) {
        return InkWell(
          onTap: () {
            if (controller.isSaved(lesson)) {
              controller.removeVideo(course, lesson);
            } else {
              controller.saveVideo(course, lesson);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: controller.isSaved(lesson) ?
            SvgPicture.asset(
              ImageAssets.bookmarkSelectedVideo,
              height: 21.5,
              width: 21.5,
                color: ColorManager.primary,
            )
            :
            SvgPicture.asset(
              height: 21.5,
              width: 21.5,
              ImageAssets.bookmarkVideo,
              color: ColorManager.primary,
            ) ,
          ),
        );
      },
    );
  }
}
