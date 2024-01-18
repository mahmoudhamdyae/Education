import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/home/widgets/home_not_authenticated/controller/home_not_authenticated_controller.dart';
import 'package:education/presentation/screens/home/widgets/home_not_authenticated/widgets/courses.dart';
import 'package:education/presentation/screens/home/widgets/home_not_authenticated/widgets/sfoof.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../widgets/empty_screen.dart';
import '../../../../../widgets/error_screen.dart';
import '../../../../../widgets/loading_screen.dart';

class HomeNotAuthenticated extends StatelessWidget {
  const HomeNotAuthenticated({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Sfoof(sfoof: [
          AppStrings.saff1,
          AppStrings.saff2,
          AppStrings.saff3,
          AppStrings.saff4,
          AppStrings.saff5,
          AppStrings.saff6,
          AppStrings.saff7,
          AppStrings.saff8,
          AppStrings.saff9,
          AppStrings.saff10,
          AppStrings.saff11,
          AppStrings.saff12,
        ]),
        GetX<HomeNotAuthenticatedController>(
          init: Get.find<HomeNotAuthenticatedController>(),
          builder: (HomeNotAuthenticatedController controller) {
            if (controller.status.isLoading) {
              return const LoadingScreen();
            } else if (controller.status.isError) {
              return ErrorScreen(error: controller.status.errorMessage ?? '');
            } else if (controller.courses.isEmpty){
              return const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: EmptyScreen(emptyString: AppStrings.noCourses),
              );
            }
            return controller.saff.value == '' ? Container()
                :
            Courses(subjects: controller.courses,);
            },
        ),
      ],
    );
  }
}
