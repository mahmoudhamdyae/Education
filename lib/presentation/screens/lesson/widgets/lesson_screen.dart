import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/screens/lesson/widgets/vimeo_video_widget.dart';
import 'package:education/presentation/widgets/lessons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_prefs.dart';
import '../../../../core/constants.dart';
import '../../../../core/di.dart';
import '../../../../domain/models/lesson/lesson.dart';
import '../../../../domain/models/lesson/wehda.dart';
import '../../../resources/color_manager.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';

class LessonScreen extends StatefulWidget {

  final List<Wehda> wehdat;
  final Lesson lesson;
  late final String _vimeoVideoUrl;


  LessonScreen({super.key, required this.wehdat, required this.lesson}) {
    _vimeoVideoUrl = extractVideoId(lesson.link);
  }

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
  final AppPreferences appPreferences = instance<AppPreferences>();
  final _flutterMediaDownloaderPlugin = MediaDownload();

  String _askText = '';

  _downloadNote(String link) async {
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

  _askQuestion(String question) async {
    // try {
    //   showLoading(context);
    //   await _repository.askQuestion(question).then((error) {
    //     Navigator.of(context).pop();
    //     if (error != '' && context.mounted) {
    //       showError(context, error, () => _askQuestion(question));
    //     } else {
    //       showSuccess(context, AppStrings.askQuestionSuccess);
    //     }
    //   });
    // } on Exception catch (e) {
    //   if (context.mounted) {
    //     Navigator.of(context).pop();
    //     showError(context, e.toString(), () => _askQuestion(question));
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Passed Wehdat: ${widget.wehdat}');
    debugPrint('Passed Lesson: ${widget.lesson}');
    debugPrint('Passed Link: ${widget.lesson.link}'); // https://player.vimeo.com/video/861849145?h=ecfcceb429

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: ListView(
        children: [
          // Vimeo Video
          SizedBox(
            width: double.infinity,
            height: 200,
            child: PlayVideoFromVimeo(vimeoVideoUrl: widget._vimeoVideoUrl),
          ),
          const SizedBox(height: AppSize.s16,),
          // مذكرة الدرس PDF
          InkWell(
            onTap: () { _downloadNote(widget.lesson.pdf); },
            child: const Padding(
              padding: EdgeInsets.all(AppPadding.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download, color: ColorManager.lightPrimary,),
                  Text(
                    AppStrings.lessonNote,
                    style: TextStyle(
                      color: ColorManager.lightPrimary
                    ),
                  ),
                ],
              ),
            )
          ),
          // Ask Question - استفسار
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _askText = text;
                });
              },
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  labelText: AppStrings.writeQuestionTextField,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1)
                  )
              ),
            ),
          ),
          // إرسال Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: FilledButton(
                onPressed: _askText.isEmpty ? null : () {
                  _askQuestion(_askText);
                },
                child: const Text(AppStrings.sendButton)
            ),
          ),
          const SizedBox(height: AppSize.s12,),
          // قائمة دروس المادة
          const Text(
            AppStrings.lessonsList,
            style: TextStyle(
              fontSize: FontSize.s20
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSize.s16,),
          LessonsWidget(
            wehdat: widget.wehdat,
            isInLessonScreen: true,
          ),
        ],
      ),
    );
  }
}

