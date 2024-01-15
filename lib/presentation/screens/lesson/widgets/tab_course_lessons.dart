import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/lesson/controller/lesson_controller.dart';
import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';

class TabCourseLessons extends StatelessWidget {

  final bool isUserLoggedIn = Get.find<AuthController>().isUserLoggedIn();
  TabCourseLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GetX<LessonController>(
            init: Get.find<LessonController>(),
            builder: (LessonController controller) {
              return ListView.separated(
                itemCount: controller.wehdat[0].lessons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: InkWell(
                      onTap: () {
                        // Get.replace(const LessonScreen());
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorManager.secondary, width: 1)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                index < 9 ? '0${index + 1}' : '${index + 1}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.secondary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0,),
                          Text(
                            controller.wehdat[0].lessons[index].title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: ColorManager.primary, width: 1.5)
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.bookmark_border,
                                  color: ColorManager.primary,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  child: Divider(color: ColorManager.grey, thickness: 0.08,),
                );
              },
              );
            },
          ),
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
