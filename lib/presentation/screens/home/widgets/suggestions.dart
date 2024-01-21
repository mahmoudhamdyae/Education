import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/home/widgets/suggestion_item.dart';
import 'package:education/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../resources/color_manager.dart';

class Suggestions extends StatelessWidget {

  final List<Course> subjects;
  final String title;
  const Suggestions({super.key, required this.subjects, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TopBar(title: title,),
        GridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
          ),
          crossAxisCount: (MediaQuery.of(context).size.width ~/ 160).toInt(),
          childAspectRatio: (1/1.7),
          children: List.generate(subjects.length, (index) {
            return SuggestionItem(course: subjects[index],);
          }),
        ),
      ],
    );
  }
}
