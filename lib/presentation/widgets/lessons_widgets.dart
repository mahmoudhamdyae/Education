import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/screens/lesson/widgets/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/lesson/wehda.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import 'dialogs/require_auth_dialog.dart';

class LessonsWidget extends StatefulWidget {
  final List<Wehda> wehdat;
  final bool isInLessonScreen;

  const LessonsWidget({super.key, required this.wehdat, required this.isInLessonScreen});

  @override
  State<LessonsWidget> createState() => _LessonsWidgetState();
}

class _LessonsWidgetState extends State<LessonsWidget> {
  int expanded = -1;
  late final bool isUserLoggedIn;
  final Repository _appPreferences = Get.find<Repository>();

  @override
  void initState() {
    super.initState();
    _setUserLoggedIn();
  }

  Future<void> _setUserLoggedIn() async {
    if (_appPreferences.isUserLoggedIn()) {
      isUserLoggedIn = true;
    } else {
      isUserLoggedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.wehdat.length,
        itemBuilder: (context, index) {
          return _buildLessonItem(widget.wehdat, widget.wehdat[index], index, expanded, (index) {
            setState(() {
              if (expanded == index) {
                expanded = -1;
              } else {
                expanded = index;
              }
            });
          });
        });
  }

  Widget _buildLessonItem(List<Wehda> wehdat, Wehda wehda, int index, int expanded, Function(int) expand) {
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
                      if (widget.isInLessonScreen) {
                        Navigator.of(context).pop();
                      }
                      Get.to(const LessonScreen());
                    } else {
                      if (index == 0 && lessonIndex == 0) {
                        if (widget.isInLessonScreen) {
                          Navigator.of(context).pop();
                        }
                        Get.to(const LessonScreen());
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