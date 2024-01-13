import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/subscription/controller/subscription_controller.dart';
import 'package:education/presentation/screens/subscription/widgets/subscription_screen_body.dart';
import 'package:education/presentation/widgets/empty_screen.dart';
import 'package:education/presentation/widgets/error_screen.dart';
import 'package:education/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/require_log_in_view.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  final Repository _appPreferences = Get.find<Repository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _appPreferences.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              // User logged in
              return GetX<SubscriptionController>(
                  init: Get.find<SubscriptionController>(),
                  builder: (controller) {
                      if (controller.status.isLoading) {
                        return const LoadingScreen();
                      } else if (controller.status.isError) {
                        return ErrorScreen(error: controller.status.errorMessage ?? '');
                      } else if (controller.courses.isEmpty) {
                        return const EmptyScreen(emptyString: AppStrings.emptySubscriptions);
                      } else {
                        final courses = controller.courses;
                        return SubscriptionScreenBody(courses: courses);
                      }
                    },
                );
            } else {
              // User not logged in
              return const RequireLogInView();
            }
          } else {
            return Container();
          }
        }
    );
  }
}
