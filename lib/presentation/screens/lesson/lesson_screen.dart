import 'package:flutter/material.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';

import '../../resources/color_manager.dart';

class LessonScreen extends StatelessWidget {

  final String lessonName;
  final String _vimeoVideoUrl = 'https://vimeo.com/70591644';
  const LessonScreen({super.key, required this.lessonName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lessonName),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        child: VimeoVideoPlayer(
          url: _vimeoVideoUrl,
        ),
      ),
    );
  }
}
