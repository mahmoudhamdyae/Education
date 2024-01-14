import 'package:flutter/cupertino.dart';

import '../../../../domain/models/lesson/wehda.dart';
import 'course_lessons_widget.dart';

class TabCourseLessons extends StatelessWidget {

  final List<Wehda> wehdat;
  final bool isInLessonScreen;

  const TabCourseLessons({super.key, required this.wehdat, required this.isInLessonScreen});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CourseLessonWidget(
        wehdat: wehdat,
        isInLessonScreen: isInLessonScreen,
      ),
    );
  }
}
