import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/screens/lesson/widgets/vimeo_video_widget.dart';
import 'package:education/presentation/widgets/lessons_widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_prefs.dart';
import '../../../../core/di.dart';
import '../../../../domain/models/lesson/lesson.dart';
import '../../../resources/color_manager.dart';
import '../controller/lesson_controller.dart';

class LessonScreen extends StatefulWidget {

  final List<dynamic> parameters;
  late final String _vimeoVideoUrl;


  LessonScreen({super.key, required this.parameters}) {
    _vimeoVideoUrl = extractVideoId((parameters[1] as Lesson).link);
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
  final LessonController _controller = instance<LessonController>();
  final AppPreferences appPreferences = instance<AppPreferences>();

  late bool isUserLoggedIn;
  final TextEditingController _askController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _setUserLoggedIn();
  }

  Future<void> _setUserLoggedIn() async {
    if (await appPreferences.isUserLoggedIn()) {
      isUserLoggedIn = true;
    } else {
      isUserLoggedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Passed Wehdat: ${widget.parameters[0]}');
    debugPrint('Passed Lesson: ${widget.parameters[1]}');
    debugPrint('Passed Link: ${(widget.parameters[1] as Lesson).link}'); // https://player.vimeo.com/video/861849145?h=ecfcceb429

    return Scaffold(
      appBar: AppBar(
        title: Text((widget.parameters[1] as Lesson).title),
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
          // Download PDF
          InkWell(
            onTap: () {
            },
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
          // Ask Question
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: TextFormField(
              controller: _askController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: AppStrings.writeQuestionTextField,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: FilledButton(
                onPressed: () {
                  _controller.askQuestion(_askController.text);
                },
                child: const Text(AppStrings.sendButton)
            ),
          ),
          // Lessons List
          const SizedBox(height: AppSize.s12,),
          const Text(
            AppStrings.lessonsList,
            style: TextStyle(
              fontSize: FontSize.s20
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSize.s16,),
          LessonsWidget(isUserLoggedIn: false, wehdat: widget.parameters[0], isInLessonScreen: true,),
        ],
      ),
    );
  }
}

