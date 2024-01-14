import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/lesson/widgets/tab_course_lessons.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/lesson/wehda.dart';

class CourseTabs extends StatefulWidget {

  final List<Wehda> wehdat;
  final bool isInLessonScreen;

  const CourseTabs({super.key, required this.wehdat, required this.isInLessonScreen});

  @override
  State<CourseTabs> createState() => _CourseTabsState();
}

class _CourseTabsState extends State<CourseTabs> {

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.tabLessons,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Divider(
                        color: ColorManager.primary,
                        height: 2,
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: const Center(
                    child: Text(
                      AppStrings.tabAttachments,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
            ),
            Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                  child: const Center(
                    child: Text(
                      AppStrings.tabTests,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
        // const SizedBox(height: 8,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),
        // const SizedBox(height: 16,),
        selectedTab == 0 ? TabCourseLessons(
          wehdat: widget.wehdat,
          isInLessonScreen: widget.isInLessonScreen,
        ) : selectedTab == 1 ?
        Center(child: Text('morfa'),) :
        Center(child: Text('morfa'),),
      ],
    );
  }
}
