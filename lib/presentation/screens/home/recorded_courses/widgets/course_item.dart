import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/screens/course/widgets/course_screen.dart';
import 'package:education/presentation/screens/home/subject/widgets/subject_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/courses/course.dart';
import '../../../../widgets/dialogs/require_auth_dialog.dart';

class CourseItem extends StatelessWidget {

  final Course course;
  final Repository appPreferences = Get.find<Repository>();

  CourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: ColorManager.primary,
      ),
      child: InkWell(
        onTap: () =>
          // Get.to(() => const SubjectScreen(), arguments: { 'course': course }),
          Get.to(() => CourseScreen(subject: course)),
        child: Column(
          children: [
            Text(
              course.name,
              style: const TextStyle(
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.bold,
                color: ColorManager.white,
              ),
            ),
            const SizedBox(height: AppSize.s8,),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF008B8B))),
                      onPressed: () async {
                        if (appPreferences.isUserLoggedIn()) {
                        // Navigator.of(context, rootNavigator: true).pushNamed(Routes.teacherRoute);
                        } else {
                          if (context.mounted) showRequireAuthDialog(context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p2),
                        child: Column(
                          children: [
                            const Text(
                              AppStrings.monthlySubscription,
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                            Text(
                              '${course.month} ${AppStrings.dinar}',
                              style: const TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                const SizedBox(width: AppSize.s16,),
                Expanded(
                  child: FilledButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF008B8B))),
                      onPressed: () async {
                        if (appPreferences.isUserLoggedIn()) {
                        } else {
                          if (context.mounted) showRequireAuthDialog(context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p2),
                        child: Column(
                          children: [
                            const Text(
                              AppStrings.termSubscription,
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                            Text(
                              '${course.term} ${AppStrings.dinar}',
                              style: const TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
