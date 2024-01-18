import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/models/courses/course.dart';
import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../suggestion_item.dart';

class Courses extends StatelessWidget {

  final List<Course> subjects;
  const Courses({super.key, required this.subjects});

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
                AppStrings.homeCourses,
                style: getLargeStyle(),
              ),
              Expanded(child: Container()),
              // InkWell(
              //   onTap: () {
              //     // See All
              //   },
              //   child: Text(
              //     AppStrings.seeAll,
              //     style: getSmallStyle(color: ColorManager.secondary, decoration: TextDecoration.underline),
              //   ),
              // ),
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
