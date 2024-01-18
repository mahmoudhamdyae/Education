import 'package:education/presentation/screens/home/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/courses/course.dart';

class Suggestions extends StatelessWidget {

  final List<Course> subjects;
  const Suggestions({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
      ),
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
      childAspectRatio: (1/1.7),
      children: List.generate(subjects.length, (index) {
        return SuggestionItem(course: subjects[index],);
      }),
    );
  }
}
