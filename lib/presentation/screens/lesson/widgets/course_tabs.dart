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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTab = 0;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        AppStrings.tabLessons,
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
                        selectedTab = 2;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 40.0),
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
        ),
        Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: selectedTab == 0 ? const Divider(
                        color: ColorManager.primary,
                        thickness: 3,
                      ) : Container(),
                    ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: selectedTab == 1 ? const Divider(
                      color: ColorManager.primary,
                      thickness: 3,
                    ) : Container(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: selectedTab == 2 ? const Divider(
                      color: ColorManager.primary,
                      thickness: 3,
                    ) : Container(),
                  ),
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(height: 16,),
        selectedTab == 0 ? TabCourseLessons(
          wehdat: widget.wehdat,
          isInLessonScreen: widget.isInLessonScreen,
        ) : selectedTab == 1 ?
        const Center(child: Text('morfa'),) :
        Center(child: Text('moral2'),),
      ],
    );
  }
}
