import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/resources/routes_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_prefs.dart';
import '../../../../../core/di.dart';
import '../../../../../domain/models/courses/course.dart';
import '../../../../widgets/dialogs/require_auth_dialog.dart';

class CourseItem extends StatelessWidget {

  final Course course;
  final AppPreferences appPreferences = instance<AppPreferences>();

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
        onTap: () {
          Navigator.of(context).pushNamed(Routes.subjectRoute, arguments: course);
        },
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
                      onPressed: () async {
                        if (await appPreferences.isUserLoggedIn()) {
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
                      onPressed: () async {
                        if (await appPreferences.isUserLoggedIn()) {
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
