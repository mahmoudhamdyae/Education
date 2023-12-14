import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/widgets/dialogs/choose_saff_dialog.dart';
import 'package:flutter/material.dart';

showChooseMarhalaDialog(BuildContext context, Function(String, String) onTap) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // The shape of the dialog
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          // The content of the dialog
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(AppStrings.pleaseChooseMarhala),
              const SizedBox(
                height: AppSize.s16,
              ),
              // المرحلة الابتدائية
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  showChooseSaffDialog(context, AppStrings.primaryMarhala, (saff) =>
                      onTap(AppStrings.primaryMarhala, saff));
                },
                  child: const ListTile(
                      title: Text(AppStrings.primaryMarhala)
                  )
              ),
              // المرحلة المتوسطة
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    showChooseSaffDialog(context, AppStrings.mediumMarhala, (saff) =>
                        onTap(AppStrings.mediumMarhala, saff));
                  },
                  child: const ListTile(
                      title: Text(AppStrings.mediumMarhala)
                  )
              ),
              // المرحلة الثانوية
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    showChooseSaffDialog(context, AppStrings.secondaryMarhala, (saff) =>
                        onTap(AppStrings.secondaryMarhala, saff));
                  },
                  child: const ListTile(
                      title: Text(AppStrings.secondaryMarhala)
                  )
              ),
              // القدرات
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onTap(AppStrings.qodoratMarhala, '');
                  },
                  child: const ListTile(
                      title: Text(AppStrings.qodoratMarhala)
                  )
              ),
            ],
          ),
        );
      }
  );
}