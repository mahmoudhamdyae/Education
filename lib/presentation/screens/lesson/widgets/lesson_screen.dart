import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/lesson/controller/lesson_controller.dart';
import 'package:education/presentation/screens/lesson/widgets/vimeo_video_widget.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:education/presentation/widgets/error_screen.dart';
import 'package:education/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../resources/color_manager.dart';

import '../../../resources/styles_manager.dart';
import 'course_tabs.dart';

class LessonScreen extends StatefulWidget {

  const LessonScreen({super.key});

  @visibleForTesting
  String extractVideoId(String url) {
    RegExp regExp = RegExp(r'/(\d+)\??');
    Match? match = regExp.firstMatch(url);

    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    } else {
      throw Exception('Video ID not found in URL');
    }
  }

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final Repository appPreferences = Get.find<Repository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetX<LessonController>(
            init: Get.find<LessonController>(),
            builder: (LessonController controller) {
              if (controller.status.isLoading) {
                return const LoadingScreen();
              } else if (controller.status.isError) {
                return ErrorScreen(error: controller.status.errorMessage ?? '');
              } else if (controller.wehdat.isEmpty) {
                return const EmptyScreen(emptyString: AppStrings.emptyTutorials);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Vimeo Video
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: PlayVideoFromVimeo(vimeoVideoUrl: widget.extractVideoId(controller.videoLink.value)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      right: 16.0,
                      left: 16.0,
                      bottom: 0.0,
                    ),
                    child: Text(
                      (Get.arguments['course'] as Course).name,
                      style: getLargeStyle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0.0,
                      right: 16.0,
                      left: 16.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      'احمد السعدني',
                      style: getSmallStyle(
                        color: const Color(0xff808080),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CourseTabs(link: controller.wehdat[0].lessons[0].pdf,),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, right: 8.0),
            child: IconButton(
                onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorManager.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

