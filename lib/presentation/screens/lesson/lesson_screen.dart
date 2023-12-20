import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/screens/lesson/vimeo_video_widget.dart';
import 'package:education/presentation/widgets/lessons_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/app_prefs.dart';
import '../../../core/di.dart';
import '../../../domain/models/lesson/lesson.dart';
import '../../resources/color_manager.dart';

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
  late bool isUserLoggedIn;

  final AppPreferences appPreferences = instance<AppPreferences>();

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
      body: Column(
        children: [
          // Vimeo Video
          SizedBox(
            width: double.infinity,
            height: 200,
            child: PlayVideoFromVimeo(vimeoVideoUrl: widget._vimeoVideoUrl),
          ),
          // Download PDF
          const SizedBox(height: AppSize.s16,),
          InkWell(
            onTap: () {
            },
            child: const Row(
              children: [
                Icon(Icons.download),
                Text(AppStrings.lessonNote),
              ],
            ),
          ),
          // Lessons List
          const SizedBox(height: AppSize.s16,),
          const Text(AppStrings.lessonsList),
          LessonsWidget(isUserLoggedIn: false, wehdat: widget.parameters[0], isInLessonScreen: true,),
        ],
      ),
    );
  }
}

