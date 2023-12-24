import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../core/app_prefs.dart';
import '../../../../../core/di.dart';
import '../../../../../domain/models/courses/course.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../widgets/empty_screen.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/lessons_widgets.dart';
import '../../../../widgets/loading_screen.dart';
import '../controller/subject_controller.dart';

class SubjectScreen extends StatefulWidget {

  final Course course;

  const SubjectScreen({super.key, required this.course});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  late bool isUserLoggedIn;
  bool firstCreate = true;

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final SubjectController _controller = Get.find<SubjectController>();

  @override
  void initState() {
    super.initState();

    _setUserLoggedIn();
  }

  Future<void> _setUserLoggedIn() async {
    if (await _appPreferences.isUserLoggedIn()) {
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
          return LessonsWidget(isUserLoggedIn: isUserLoggedIn, wehdat: wehdat, isInLessonScreen: false,);
        }
      }),
    );
  }
}
