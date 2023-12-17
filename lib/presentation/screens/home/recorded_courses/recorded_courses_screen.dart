import 'package:education/domain/models/courses/baqa.dart';
import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/screens/home/recorded_courses/course_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_prefs.dart';
import '../../../../core/di.dart';
import '../../../../domain/models/courses/class_model.dart';
import '../../../../domain/models/courses/course.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../widgets/dialogs/require_auth_dialog.dart';

class RecordedCoursesScreen extends StatelessWidget {
  
  final List<String>? parameters;
  late final ClassModel classModel;
  final AppPreferences appPreferences = instance<AppPreferences>();

  RecordedCoursesScreen({super.key, required this.parameters}) {
    classModel = ClassModel(
        [
          Course('اللغة الإنجليزية', 10, 22, parameters![1]),
          Course('اللغة العربية', 10, 22, parameters![1]),
          Course('الأحياء', 12, 25, parameters![1]),
          Course('الكيمياء', 12, 25, parameters![1]),
          Course('التاريخ', 8, 20, parameters![1]),
          Course('الرياضيات', 12, 25, parameters![1]),
          Course('الفيزياء', 12, 25, parameters![1]),
        ],
        [
          Baqa(8, 7, 60),
          Baqa(7, 0, 38),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('passed marhala: ${parameters![0]}');
    debugPrint('passed saff: ${parameters![1]}');
    return Scaffold(
      appBar: AppBar(
        title: Text(parameters![1] == '' ? AppStrings.recordedCourses : '${AppStrings.recordedCoursesTitleBar} ${parameters![1]}'),
        leading: IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: ListView(
        children: [
          _buildHeader(context),
          _buildCoursesList(),
        ],
      ),
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
                  if (await appPreferences.isUserLoggedIn()) {
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
                  if (await appPreferences.isUserLoggedIn()) {
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
          style: const TextStyle(color: Colors.yellow),
        ),
        Text(
          '${AppStrings.baqaPrice} :$price ${AppStrings.dinar}',
          style: const TextStyle(color: Colors.yellow),
        ),
      ],
    );
  }
}
