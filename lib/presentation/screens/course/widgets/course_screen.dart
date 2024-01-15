import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${subject.term.toString()} د.ك',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              // 5 وحدات - 32 درس
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '5 وحدات - 32 درس',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          subject.rate.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.primary,
                          ),
                        ),
                        const SizedBox(width: 4.0,),
                        const Icon(
                          Icons.star,
                          color: ColorManager.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Divider(height: 1,),
              ),
              // المدرس
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppStrings.courseTeacher,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'أحمد السعدنى',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 1.0,
                          color: ColorManager.primary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                      onPressed: () {
                      Get.to(() => LessonScreen(wehdat: [], lesson: Lesson('title', 'https://player.vimeo.com/video/70591644', 'sample PDF.pdf', 'free')));
                      },
                      child: const Text(
                        AppStrings.watchFirstLesson,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                              )
                          )
                      ),
                      onPressed: () {
                      },
                      child: const Text(
                        AppStrings.buyCourse,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
              child: IconButton(
                onPressed: () {
                  // Add or Remove fav
                },
                icon: SvgPicture.asset(ImageAssets.bookmark,),
              )
          )
        ],
      ),
    );
  }
}
