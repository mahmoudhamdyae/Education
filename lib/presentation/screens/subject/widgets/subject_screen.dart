import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/courses/course.dart';
import '../../../resources/color_manager.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((Get.arguments['course'] as Course).name),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
