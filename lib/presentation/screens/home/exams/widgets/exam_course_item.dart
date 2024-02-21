import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/courses/course.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../widgets/bookmark_course.dart';
import '../../../course/widgets/course_screen.dart';

class ExamCourseItem extends StatelessWidget {

  final Course course;
  const ExamCourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CourseScreen(subject: course,));
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(
            color: ColorManager.lightGrey,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -12,
              right: -2,
              child: Image.asset(
                ImageAssets.course,
                height: 75,
                width: 100,
              ),
            ),
            Positioned(
              right: 125.0,
              top: 16.0,
              child: Text(
                course.name,
                style: getLargeStyle(
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            Positioned(
              top: -8,
              left: -8,
              child: BookmarkCourse(course: course),
            ),
            Positioned(
              top: 16.0,
              left: 50.0,
              child: Text(
                course.teacher,
                style: getSmallStyle(
                  color: const Color(0xff808080),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
