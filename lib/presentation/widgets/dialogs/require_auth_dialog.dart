import 'package:education/presentation/resources/routes_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/values_manager.dart';

showRequireAuthDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // The shape of the dialog
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          // The content of the dialog
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(AppStrings.pleaseLogIn),
              const SizedBox(height: AppSize.s16,),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(AppStrings.cancel)
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(Routes.loginRoute);
                      },
                      child: const Text(AppStrings.continueButton)
                  ),
                ],
              )
            ],
          ),
        );
      }
  );
}