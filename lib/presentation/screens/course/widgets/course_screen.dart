import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Image.asset(
                ImageAssets.course,
                height: 240,
              ),
              const SizedBox(height: 16.0,),
            ],
          ),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.black,
                ),
              )
          ),
          Positioned(
              top: 32.0,
              left: 16.0,
              child: IconButton(
                onPressed: () {
                  // Add or Remove fav
                },
                icon: SvgPicture.asset(ImageAssets.bookmark,),
              )
          )
        ],
      ),
    );
  }
}
