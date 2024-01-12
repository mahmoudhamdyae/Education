import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/auth/login/widgets/login_screen.dart';
import 'package:education/presentation/screens/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/strings_manager.dart';

class AppBarActions extends StatelessWidget {
  AppBarActions({super.key});

  final Repository _repository = Get.find<Repository>();

  _signOut(BuildContext context) {
    _repository.signOut().then((value) {
      Get.offAll(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _repository.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return Row(
                children: [
                  // Notifications Button
                  IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        color: ColorManager.white,
                      ),
                      onPressed: () {
                        Get.to(const NotificationsScreen());
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
                                                _signOut(context);
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
                                ));
                      }),
                ],
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }
}
