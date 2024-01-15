import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/lesson/controller/lesson_controller.dart';
import 'package:education/presentation/screens/lesson/widgets/vimeo_video_widget.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:education/presentation/widgets/error_screen.dart';
import 'package:education/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants.dart';
import '../../../../domain/models/courses/course.dart';
import '../../../resources/color_manager.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';

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
  final _flutterMediaDownloaderPlugin = MediaDownload();

  void _downloadNote(String link) async {
    String url = '${Constants.baseUrl}filedownload/$link';
    debugPrint('url: $url');
    Get.showSnackbar(
      const GetSnackBar(
        title: null,
        message: AppStrings.noteDownloading,
        icon: Icon(Icons.download, color: ColorManager.white,),
        duration: Duration(seconds: 3),
      ),
    );
    _flutterMediaDownloaderPlugin.downloadMedia(context, url).catchError((error) {
      if (Get.isSnackbarOpen) Get.back();
      Get.showSnackbar(
        const GetSnackBar(
          title: null,
          message: AppStrings.noteDownloadError,
          icon: Icon(Icons.error, color: ColorManager.white,),
          duration: Duration(seconds: 3),
        ),
      );
    }).then((value) {
      if (Get.isSnackbarOpen) Get.back();
      Get.showSnackbar(
        const GetSnackBar(
          title: null,
          message: AppStrings.noteDownloaded,
          icon: Icon(Icons.download_done, color: ColorManager.white,),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

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
                    child: PlayVideoFromVimeo(vimeoVideoUrl: widget.extractVideoId(controller.wehdat[0].lessons[0].link)),
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 0.0,
                      right: 16.0,
                      left: 16.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      'احمد السعدني',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: CourseTabs(),
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

