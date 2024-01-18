import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../widgets/bookmark_course.dart';
import '../../../widgets/buy_widget.dart';
import '../../../widgets/price_widget.dart';
import '../../course/widgets/course_screen.dart';

class SuggestionItem extends StatelessWidget {

  final Course course;
  const SuggestionItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CourseScreen(subject: course,));
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              border: Border.all(
                color: ColorManager.lightGrey,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: getLargeStyle(
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            course.teacher,
                            style: getSmallStyle(
                              color: const Color(0xff808080),
                            ),
                          ),
                        ],
                      ),
                      PriceWidget(price: course.month, month: AppStrings.monthly,),
                    ],
                  ),
                ),
                BuyWidget(course: course, width: 200,),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 8,
            child: BookmarkCourse(course: course),
          )
        ],
      ),
    );
  }
}
