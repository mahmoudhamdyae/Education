import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_prefs.dart';
import '../../core/di.dart';
import '../../data/remote/account_service.dart';
import '../resources/strings_manager.dart';

class LogOutDialog extends StatelessWidget {
  LogOutDialog({super.key});

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final AccountService _accountService = Get.find<AccountService>();

  _signOut(BuildContext context) {
    _accountService.signOut().then((value) {
      _appPreferences.logout();
      Get.offAll(const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _appPreferences.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return IconButton(
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: ColorManager.white,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(AppStrings.logoutDialogText),
                                    const SizedBox(height: 15),
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
                  });
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }
}
