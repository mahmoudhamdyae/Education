import 'package:education/presentation/screens/home/widgets/subjects.dart';
import 'package:education/presentation/screens/home/widgets/suggestions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../resources/strings_manager.dart';
import '../../../widgets/empty_screen.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import '../controller/home_controller.dart';

class HomeScreenCourses extends StatelessWidget {
  const HomeScreenCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: Get.find<HomeController>(),
      builder: (HomeController controller) {
        if (controller.status.isLoading) {
          return const LoadingScreen();
        } else if (controller.status.isError) {
          return ErrorScreen(error: controller.status.errorMessage ?? '');
        } else if (controller.classModel.value.courses.isEmpty){
          return const Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: EmptyScreen(emptyString: AppStrings.noCourses),
          );
        } else {
          final classModel = controller.classModel.value;
          return Column(
            children: [
              Subjects(subjects: classModel.courses,),
              Suggestions(subjects: classModel.courses,),
            ],
          );
        }
      },
    );
  }
}
