
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/widgets/error_screen.dart';
import 'package:education/presentation/widgets/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/lesson_controller.dart';

class CommentsList extends StatelessWidget {

  const CommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LessonController>(
      init: Get.find<LessonController>(),
      builder: (LessonController controller) {
        if (controller.getCommentsStatus.isLoading) {
          return const LoadingScreen();
        } else if (controller.getCommentsStatus.isError) {
          return ErrorScreen(error: controller.getCommentsStatus.errorMessage ?? '');
        } else if (controller.comments.isEmpty) {
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
        return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: controller.comments.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(controller.comments[index].comment!);
          },
        );
      },
    );
  }
}
