import 'package:education/domain/models/courses/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/styles_manager.dart';
import '../../course/widgets/course_screen.dart';

class SubjectItem extends StatelessWidget {

  final Course course;
  const SubjectItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CourseScreen(subject: course,));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            shape: BoxShape.rectangle,
            border: Border.all(color: const Color(0xffF2F2F2))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            course.name,
            style: getSmallStyle(),
          ),
        ),
      ),
    );
  }
}
