import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

showSuccess(BuildContext context, String message) {
  return showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      // The shape of the dialog
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
      ),
      // The title of the dialog
      title: const Text(AppStrings.successDialogTitle),
      // The content of the dialog
      content: Column(
        children: [
          // todo Success Image
          // Message Text
          Text(message),
          // Ok Button
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(AppStrings.successDialogAction)
              ),
            ],
          )
        ],
      ),
    );
  });
}