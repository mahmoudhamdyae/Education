import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/lesson/wehda.dart';

class TabCourseLessons extends StatelessWidget {

  final List<Wehda> wehdat;
  final bool isInLessonScreen;

  final lessons = List.generate(10, (index) => 'اسم الدرس');

  TabCourseLessons({super.key, required this.wehdat, required this.isInLessonScreen});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            color: ColorManager.secondary
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0,),
                  Text(
                    lessons[index],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container()
                ],
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Divider(color: ColorManager.grey, thickness: 0.08,),
            );
      },
      ),
    );
  }
}
