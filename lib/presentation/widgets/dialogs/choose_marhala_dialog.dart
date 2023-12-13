import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

showChooseMarhalaDialog(BuildContext context, Function(String) onTap) {
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
                  onTap(AppStrings.primaryMarhala);
                },
                  child: const ListTile(
                      title: Text(AppStrings.primaryMarhala)
                  )
              ),
              // المرحلة المتوسطة
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onTap(AppStrings.mediumMarhala);
                  },
                  child: const ListTile(
                      title: Text(AppStrings.mediumMarhala)
                  )
              ),
              // المرحلة الثانوية
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onTap(AppStrings.secondaryMarhala);
                  },
                  child: const ListTile(
                      title: Text(AppStrings.secondaryMarhala)
                  )
              ),
              // القدرات
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onTap(AppStrings.qodoratMarhala);
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