import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/lesson/widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/lesson_controller.dart';

class CommentsList extends StatelessWidget {

  const CommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LessonController>(
      init: Get.find<LessonController>(),
      builder: (LessonController controller) {
       if (controller.comments.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Text(
                AppStrings.noComments,
                style: getLargeStyle(),
              ),
            ),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: controller.comments.length,
          itemBuilder: (BuildContext context, int index) {
            return CommentItem(comment: controller.comments[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 1, color: ColorManager.lightGrey,);
          },
        );
      },
    );
  }
}
