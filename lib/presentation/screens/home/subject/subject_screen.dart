import 'package:education/domain/models/course.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

class SubjectScreen extends StatelessWidget {

  final Course course;
  const SubjectScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
        leading: IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: Container(),
    );
  }
}
