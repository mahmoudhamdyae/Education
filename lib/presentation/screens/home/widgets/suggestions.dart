import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../course/widgets/course_screen.dart';

class Suggestions extends StatelessWidget {

  final List<Course> subjects;
  const Suggestions({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              const Text(
                AppStrings.suggestions,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  // See All
                },
                child: const Text(
                  AppStrings.seeAll,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2B7CB3),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => CourseScreen(subject: subjects[index],));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                            border: Border.all(
                                color: const Color(0xffF2F2F2),
                                width: 1,
                            )
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              ImageAssets.course,
                              height: 150,
                              width: 225,
                            ),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    subjects[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '${subjects[index].term} د.ك',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'أحمد السعدنى',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff808080),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        subjects[index].rate.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: ColorManager.primary,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0,),
                                      const Icon(
                                        Icons.star,
                                        color: ColorManager.primary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: FilledButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                                  ),
                                  onPressed: () {
                                  },
                                  child: const Text(
                                    AppStrings.buy,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.white,
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 8,
                        child: IconButton(
                            onPressed: () {
                              // Add to fav
                            },
                            icon: SvgPicture.asset(
                              ImageAssets.bookmark,
                              height: 32,
                              width: 20,
                            ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
