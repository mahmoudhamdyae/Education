import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../../../core/launch_site.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

showRequireAuthDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          // The content of the dialog
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.pleaseLogIn,
                style: getLargeStyle(),
              ),
              const SizedBox(height: AppSize.s16,),
              Row(
                children: [
                  OutlinedButton(
                    style: getOutlinedButtonStyle(),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppStrings.cancel,
                        style: getSmallStyle(),
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                        launchSite(Constants.siteUrl);
                      },
                      child: Text(
                        AppStrings.continueButton,
                        style: getSmallStyle(
                          color: ColorManager.secondary
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
        );
      }
  );
}