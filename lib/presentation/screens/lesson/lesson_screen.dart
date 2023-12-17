import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class LessonScreen extends StatelessWidget {

  final String lessonName;
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
      body: Container(),
    );
  }
}
