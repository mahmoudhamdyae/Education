import 'package:education/presentation/screens/course/widgets/course_screen.dart';
import 'package:education/presentation/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/courses/course.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import 'bookmark_course.dart';
import 'buy_widget.dart';

class CoursesList extends StatelessWidget {

  final List<Course> courses;
  const CoursesList({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(() => CourseScreen(subject: courses[index]));
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffF2F2F2),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      ImageAssets.course,
                      height: 88,
                      width: 86,
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(width: 14.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courses[index].name,
                          style: getLargeStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.secondary
                          ),
                        ),
                        Text(
                          courses[index].teacher,
                          style: getSmallStyle(fontSize: 13),
                        ),
                        const SizedBox(height: 16.0,),
                        RateWidget(rate: courses[index].rate),
                      ],
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Positioned(
                  left: 0,
                  child: BookmarkCourse(course: courses[index])
              ),
              Positioned(
                  bottom: 8,
                  left: 12,
                  child: BuyWidget(course: courses[index], width: 115,)
              ),
            ],
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16.0,);
    },
    );
  }
}
