import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../core/app_prefs.dart';
import '../../../../../core/di.dart';
import '../../../../../domain/models/courses/course.dart';
import '../../../../../domain/models/lesson/wehda.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../widgets/empty_screen.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../controller/subject_controller.dart';

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
  bool firstCreate = true;

  final AppPreferences appPreferences = instance<AppPreferences>();
  final SubjectController _controller = instance<SubjectController>();

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
    if (firstCreate) {
      _controller.getTutorials(widget.course.id);
      firstCreate = false;
    }
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
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const LoadingScreen();
        } else if (_controller.error.value != '') {
          return ErrorScreen(error: _controller.error.value);
        } else if (_controller.wehdat.isEmpty) {
          return const EmptyScreen(emptyString: AppStrings.emptyTutorials);
        } else {
          final wehdat = _controller.wehdat;
          return ListView.builder(
              itemCount: wehdat.length,
              itemBuilder: (context, index) {
                return _buildLessonItem(wehdat, wehdat[index], index, expanded, (index) {
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
      }),
    );
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
                      Navigator.of(context).pushNamed(Routes.lessonRoute, arguments: [wehdat, wehda.lessons[index]]);
                    } else {
                      if (lessonIndex == 0) {
                        Navigator.of(context).pushNamed(Routes.lessonRoute, arguments: [wehdat, wehda.lessons[index]]);
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
