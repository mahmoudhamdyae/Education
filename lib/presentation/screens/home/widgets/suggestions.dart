import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/widgets/buy_button.dart';
import 'package:education/presentation/widgets/buy_widget.dart';
import 'package:education/presentation/widgets/price_widget.dart';
import 'package:education/presentation/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../widgets/bookmark_course.dart';
import '../../course/widgets/course_screen.dart';

class Suggestions extends StatelessWidget {

  final List<Course> subjects;
  const Suggestions({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                AppStrings.suggestions,
                style: getLargeStyle(),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  // See All
                },
                child: Text(
                  AppStrings.seeAll,
                  style: getSmallStyle(color: ColorManager.secondary, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => CourseScreen(subject: subjects[index],));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            border: Border.all(
                                color: const Color(0xffF2F2F2),
                                width: 1,
                            ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              ImageAssets.course,
                              height: 150,
                              width: 225,
                            ),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    subjects[index].name,
                                    style: getLargeStyle(
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  PriceWidget(price: subjects[index].term),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'أحمد السعدنى',
                                    style: getSmallStyle(
                                      color: const Color(0xff808080),
                                    ),
                                  ),
                                  RateWidget(rate: subjects[index].rate),
                                ],
                              ),
                            ),
                            BuyWidget(course: subjects[index], width: 200,),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: BookmarkCourse(course: subjects[index]),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
