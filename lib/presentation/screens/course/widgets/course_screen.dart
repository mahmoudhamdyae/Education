import 'package:education/domain/models/courses/course.dart';
import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:education/presentation/widgets/bookmark_course.dart';
import 'package:education/presentation/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants.dart';
import '../../../../core/launch_site.dart';

class CourseScreen extends StatelessWidget {

  final Course subject;
  const CourseScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageAssets.course,
                height: 240,
              ),
              // Subject Name
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subject.name,
                      style: getLargeStyle(),
                    ),
                    // 5 وحدات - 32 درس
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '5 وحدات - 32 درس',
                        style: getSmallStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PriceWidget(price: subject.month, month: AppStrings.monthly,),
                      PriceWidget(price: subject.term, month: AppStrings.termly,),
                    ],
                  ),
                  const Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: VerticalDivider(width: 1, color: ColorManager.lightGrey,)
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Divider(height: 1, color: Color(0xffF2F2F2),),
              ),
              // المدرس
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppStrings.courseTeacher,
                  style: getLargeStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  children: [
                    Image.asset(
                      ImageAssets.courseTeacher,
                      height: 40,
                      width: 40,
                    ),
                    // Teacher Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        subject.teacher,
                        style: getSmallStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              // شاهد الدرس الأول
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: getOutlinedButtonStyle(),
                    onPressed: () {
                      Get.to(() => const LessonScreen(), arguments: { 'course': subject });
                      },
                    child: Text(
                        AppStrings.watchFirstLesson,
                        style: getSmallStyle(
                          color: ColorManager.primary,
                        ),
                      ),
                  ),
                ),
              ),
              // شراء الكورس
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: getFilledButtonStyle(),
                      onPressed: () {
                        launchSite(Constants.siteUrl);
                      },
                      child: Text(
                        AppStrings.buyCourse,
                        style: getSmallStyle(
                          color: ColorManager.white,
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
          // Back Button
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.black,
                ),
              )
          ),
          // Fav Icon
          Positioned(
              top: 32.0,
              left: 16.0,
              child: BookmarkCourse(course: subject),
          )
        ],
      ),
    );
  }
}
