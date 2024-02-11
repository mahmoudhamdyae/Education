import 'package:education/presentation/screens/home/recorded_courses/widgets/recorded_courses_item.dart';
import 'package:education/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/courses/course.dart';

class RecordedCoursesList extends StatelessWidget {

  final List<Course> subjects;
  final String title;
  const RecordedCoursesList({super.key, required this.subjects, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        TopBar(title: title,),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int index) {
            return RecordedCoursesItem(course: subjects[index],);
          },
        ),
      ],
    );
  }
}
