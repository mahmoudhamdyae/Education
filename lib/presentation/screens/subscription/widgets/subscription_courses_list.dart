import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/subscription_response.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class SubscriptionCoursesList extends StatelessWidget {

  final List<UserCourses> courses;
  const SubscriptionCoursesList({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            UserCourses userCourses = courses[index];
            Course course = Course(
                userCourses.id ?? -1,
                userCourses.subjectName ?? '',
                userCourses.monthlySubscriptionPrice ?? 0,
                userCourses.termPrice ?? 0,
                userCourses.classroom ?? '',
                userCourses.type ?? '',
                userCourses.teacherRatioCourse.toString(),
                userCourses.techer?.name ?? ''
            );
            Get.to(() => const LessonScreen(), arguments: { 'course': course });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffF2F2F2),
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    ImageAssets.course,
                    height: 88,
                    width: 86,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 2.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courses[index].subjectName ?? '',
                        style: getLargeStyle(
                            color: ColorManager.secondary
                        ),
                      ),
                      Text(
                        courses[index].techer?.name ?? '',
                        style: getSmallStyle(),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${AppStrings.expireDate}\n ${courses[index].expiryDate}',
                    style: getSmallStyle(
                      color: ColorManager.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(height: 16.0,);
    },
    );
  }
}
