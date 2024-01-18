import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/auth/login/widgets/login_screen.dart';
import 'package:education/presentation/screens/notifications/widgets/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/strings_manager.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  _signOut() {
    Get.find<AuthController>().signOut()
        .then((value) => Get.offAll(() => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Get.find<AuthController>().isUserLoggedIn() ? Row(
      children: [
        // Notifications Button
        IconButton(
            icon: const Icon(
              Icons.notifications,
              color: ColorManager.white,
            ),
            onPressed: () {
              Get.to(NotificationsScreen());
            }),
        // Log out Button
        IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: ColorManager.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.logoutDialogText),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  _signOut();
                                },
                                child:
                                const Text(AppStrings.logoutOk),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(AppStrings.cancel),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              );
            }),
      ],
    ) : Container();
  }
}
