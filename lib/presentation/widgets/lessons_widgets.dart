import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:education/presentation/widgets/save_video_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/lesson/wehda.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'dialogs/require_auth_dialog.dart';

class LessonsWidget extends StatefulWidget {
  final List<Wehda> wehdat;
  final bool isInLessonScreen;

  const LessonsWidget({super.key, required this.wehdat, required this.isInLessonScreen});

  @override
  State<LessonsWidget> createState() => _LessonsWidgetState();
}

class _LessonsWidgetState extends State<LessonsWidget> {
  int expanded = -1;
  final bool isUserLoggedIn = Get.find<Repository>().isUserLoggedIn();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.wehdat.length,
        itemBuilder: (context, index) {
          return _buildLessonItem(widget.wehdat, widget.wehdat[index], index, expanded, (index) {
            setState(() {
              if (expanded == index) {
                expanded = -1;
              } else {
                expanded = index;
              }
            });
          });
        });
  }

  Widget _buildLessonItem(List<Wehda> wehdat, Wehda wehda, int index, int expanded, Function(int) expand) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: InkWell(
            onTap: () {
              expand(index);
            },
            child: Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s4),
                    color: ColorManager.white
                ),
                child: Row(
                  children: [
                    Text(
                      wehda.title,
                      style: const TextStyle(
                          color: ColorManager.black
                      ),
                    ),
                    const SizedBox(width: AppSize.s4,),
                    Icon(
                      expanded == index ? Icons.expand_less : Icons.expand_more,
                      color: ColorManager.black,
                    ),
                  ],
                )
            ),
          ),
        ),
        expanded == index ?
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: wehda.lessons.length,
            itemBuilder: (context, lessonIndex) {
              return InkWell(
                  onTap: () {
                    if (isUserLoggedIn) {
                      if (widget.isInLessonScreen) {
                        Navigator.of(context).pop();
                      }
                      Get.to(const LessonScreen());
                    } else {
                      if (index == 0 && lessonIndex == 0) {
                        if (widget.isInLessonScreen) {
                          Navigator.of(context).pop();
                        }
                        Get.to(const LessonScreen());
                      } else {
                        showRequireAuthDialog(context);
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
                    child: InkWell(
                      onTap: () {
                        Get.off(const LessonScreen(), arguments: { 'course': (Get.arguments['course'] as Course) });
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
                                lessonIndex < 9 ? '0${lessonIndex + 1}' : '${lessonIndex + 1}',
                                style: getLargeStyle(
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.secondary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0,),
                          Text(
                            wehda.lessons[lessonIndex].title,
                            style: getSmallStyle(),
                          ),
                          Expanded(child: Container()),
                          SaveVideoButton(course: (Get.arguments['course'] as Course), lesson: wehda.lessons[lessonIndex],),
                        ],
                      ),
                    ),
                  )
              );
            }
        ) : Container()
      ],
    );
  }
}