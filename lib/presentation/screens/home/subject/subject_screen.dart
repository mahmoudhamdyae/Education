import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_prefs.dart';
import '../../../../core/di.dart';
import '../../../../domain/models/courses/course.dart';
import '../../../../domain/models/lesson/wehda.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';

class SubjectScreen extends StatefulWidget {

  final Course course;
  final AppPreferences appPreferences = instance<AppPreferences>();

  SubjectScreen({super.key, required this.course});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  int expanded = -1;
  late bool isUserLoggedIn;
  List<Wehda> wehdat = [
    Wehda('كان و أخواتها - الفضل الدراسى الأول', [
      Lesson('التشبيه و أركانه', () {}),
      Lesson('تدريبات', () {}),
      Lesson('أنواع خبر كان', () {}),
    ]),
    Wehda('2كان و أخواتها - الفضل الدراسى الأول', [
      Lesson('2التشبيه و أركانه', () {}),
      Lesson('2تدريبات', () {}),
      Lesson('2أنواع خبر كان', () {}),
    ]),
  ];

  final AppPreferences appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();

    _setUserLoggedIn();
  }

  Future<void> _setUserLoggedIn() async {
    if (await appPreferences.isUserLoggedIn()) {
      isUserLoggedIn = true;
    } else {
      isUserLoggedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.name),
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
      body: ListView.builder(
          itemCount: wehdat.length,
          itemBuilder: (context, index) {
            return _buildLessonItem(wehdat[index], index, expanded, (index) {
              setState(() {
                if (expanded == index) {
                  expanded = -1;
                } else {
                  expanded = index;
                }
              });
            });
          }),
    );
  }

  Widget _buildLessonItem(Wehda wehda, int index, int expanded, Function(int) expand) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: InkWell(
            onTap: () {
              expand(index);
            },
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s4),
                    color: ColorManager.primary
                ),
                child: Row(
                  children: [
                    Icon(
                      expanded == index ? Icons.expand_less : Icons.expand_more,
                      color: ColorManager.white,
                    ),
                    const SizedBox(width: AppSize.s4,),
                    Text(
                      wehda.title,
                      style: const TextStyle(
                        color: ColorManager.white
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
        expanded == index ?
        ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: wehda.lessons.length,
            itemBuilder: (context, lessonIndex) {
              return InkWell(
                  onTap: () {
                    if (isUserLoggedIn) {
                      Navigator.of(context).pushNamed(Routes.lessonRoute, arguments: wehda.lessons[lessonIndex].title);
                    } else {
                      if (lessonIndex == 0) {
                        Navigator.of(context).pushNamed(Routes.lessonRoute, arguments: wehda.lessons[lessonIndex].title);
                      } else {
                        showRequireAuthDialog(context);
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
                    child: Row(
                      children: [
                        isUserLoggedIn ? Container() : index == 0 && lessonIndex == 0 ?
                        const Icon(
                          Icons.remove_red_eye,
                          color: ColorManager.primary,
                        ) : const Icon(Icons.lock, color: Colors.grey,),
                        isUserLoggedIn ? Container() : const SizedBox(width: AppSize.s8,),
                        Text(
                            wehda.lessons[lessonIndex].title,
                          style: TextStyle(
                            color: isUserLoggedIn ? ColorManager.primary : index == 0 && lessonIndex == 0 ? ColorManager.primary : Colors.grey
                          ),
                        ),
                      ],
                    ),
                  )
              );
            }
        ) : Container()
      ],
    );
  }
}
