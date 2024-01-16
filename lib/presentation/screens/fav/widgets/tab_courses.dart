import 'package:education/domain/models/courses/course.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/widgets/courses_list.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:education/presentation/widgets/error_screen.dart';
import 'package:education/presentation/widgets/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controller/fav_controller.dart';

class TabCourses extends StatelessWidget {
  const TabCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FavController>(
      builder: (FavController controller) {
        List<Course> favCourses = controller.courses;
        if (controller.status.isLoading) {
          return const LoadingScreen();
        } else if (controller.status.isError) {
          return ErrorScreen(error: controller.status.errorMessage ?? '');
        } else if (favCourses.isEmpty) {
          return const Expanded(child: EmptyScreen(emptyString: AppStrings.emptyFav));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CoursesList(courses: favCourses,),
        );
      },
    );
  }
}
