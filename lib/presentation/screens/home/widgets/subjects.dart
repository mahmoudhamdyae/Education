import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/home/widgets/subject_item.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/courses/course.dart';

class Subjects extends StatelessWidget {

  final List<Course> subjects;
  const Subjects({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            AppStrings.homeSubjects,
            style: getLargeStyle(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              itemBuilder: (BuildContext context, int index) {
                return SubjectItem(course: subjects[index],);
              },
            ),
          ),
        ),
        const SizedBox(height: 16.0,),
      ],
    );
  }
}
