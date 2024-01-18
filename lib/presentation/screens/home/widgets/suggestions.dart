import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/home/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../resources/strings_manager.dart';

class Suggestions extends StatelessWidget {

  final List<Course> subjects;
  const Suggestions({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                AppStrings.suggestions,
                style: getLargeStyle(),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  // See All
                },
                child: Text(
                  AppStrings.seeAll,
                  style: getSmallStyle(color: ColorManager.secondary, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              itemBuilder: (BuildContext context, int index) {
                return SuggestionItem(course: subjects[index],);
              },
            ),
          ),
        ),
      ],
    );
  }
}
