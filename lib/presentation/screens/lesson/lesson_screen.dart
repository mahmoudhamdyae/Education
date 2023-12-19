import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

import '../../../domain/models/lesson/lesson.dart';
import '../../resources/color_manager.dart';

class LessonScreen extends StatelessWidget {

  final List<dynamic> parameters;
  const LessonScreen({super.key, required this.parameters});
  // final String _vimeoVideoUrl = 'https://vimeo.com/70591644';
  // final String _vimeoVideoUrl = 'https://vimeo.com/157743578';
  // final String _vimeoVideoUrl = 'https://vimeo.com/861849145';
  // final String _vimeoVideoUrl = 'https://vimeo.com/861849145';

  @override
  Widget build(BuildContext context) {
    debugPrint('Passed Wehdat: ${parameters[0]}');
    debugPrint('Passed Lesson: ${parameters[1]}');
    debugPrint('Passed Link: ${(parameters[1] as Lesson).link}');
    return Scaffold(
      appBar: AppBar(
        title: Text((parameters[1] as Lesson).title),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        height: 200,
        child: PlayVideoFromVimeo(),
      ),
    );
  }
}

class PlayVideoFromVimeo extends StatefulWidget {
  const PlayVideoFromVimeo({Key? key}) : super(key: key);

  @override
  State<PlayVideoFromVimeo> createState() => _PlayVideoFromVimeoState();
}

class _PlayVideoFromVimeoState extends State<PlayVideoFromVimeo> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(
        '861849145',
      ),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: true,
            isLooping: false,
            videoQualityPriority: [720, 360]
        ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller);
  }
}

