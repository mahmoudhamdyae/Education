import 'package:education/domain/models/returned_video.dart';
import 'package:education/presentation/widgets/save_video_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class VideosList extends StatelessWidget {

  final List<ReturnedVideo> courses;
  const VideosList({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffF2F2F2),
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.course,
                  height: 88,
                  width: 86,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(width: 2.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courses[index].course.name,
                      style: getLargeStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.secondary
                      ),
                    ),
                    Text(
                      courses[index].lesson.title,
                      style: getSmallStyle(fontSize: 13),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                SaveVideoButton(course: courses[index].course, lesson: courses[index].lesson),
              ],
            ),
          ),
        );
      },
    );
  }
}