import 'package:education/domain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/courses/class_model.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/dialogs/require_auth_dialog.dart';
import 'course_item.dart';

class RecordedCoursesScreenBody extends StatelessWidget {

  final Repository appPreferences = Get.find<Repository>();
  final ClassModel classModel;

  RecordedCoursesScreenBody({super.key, required this.classModel});

  @override
  Widget build(BuildContext context) {
    return classModel.courses == [] || classModel.baqat == [] ? Container() : ListView(
      children: [
        _buildHeader(context),
        _buildCoursesList(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p8,
          left: AppPadding.p8,
          right: AppPadding.p8
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                if (appPreferences.isUserLoggedIn()) {
                  // Navigator.of(context, rootNavigator: true).pushNamed(Routes.teacherRoute);
                } else {
                  if (context.mounted) showRequireAuthDialog(context);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.primary,
                ),
                child: Column(
                  children: [
                    const Text(
                      AppStrings.subjectsAndNotes,
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.white,
                      ),
                    ),
                    const SizedBox(height: AppSize.s4,),
                    _buildPricesTexts(classModel.baqat[0].subjects, classModel.baqat[0].notes, classModel.baqat[0].price),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSize.s8,),
          Expanded(
            child: InkWell(
              onTap: () async {
                if (appPreferences.isUserLoggedIn()) {
                  // Navigator.of(context, rootNavigator: true).pushNamed(Routes.teacherRoute);
                } else {
                  if (context.mounted) showRequireAuthDialog(context);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                  color: ColorManager.primary,
                ),
                child: Column(
                  children: [
                    const Text(
                      AppStrings.subjects,
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.white,
                      ),
                    ),
                    const SizedBox(height: AppSize.s4,),
                    _buildPricesTexts(classModel.baqat[1].subjects, classModel.baqat[1].notes, classModel.baqat[1].price),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: classModel.courses.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: CourseItem(course: classModel.courses[index]),
        );
      },
    );
  }

  Widget _buildPricesTexts(int subjects, int notes, int price) {
    String notesString = notes == 0 ? '' : '+ $notes ${AppStrings.notesLabel}';
    return Column(
      children: [
        Text(
          '$subjects ${AppStrings.subjectsLabel} $notesString',
          style: const TextStyle(color: Color(0xFFCCCCCC)),
        ),
        Text(
          '${AppStrings.baqaPrice} :$price ${AppStrings.dinar}',
          style: const TextStyle(color: Color(0xFFCCCCCC)),
        ),
      ],
    );
  }
}
