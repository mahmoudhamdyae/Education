import 'package:education/domain/models/notes/note.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/printed_notes/controller/printed_notes_controller.dart';

showDeleteCartItemDialog(BuildContext context, Note note) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(
          AppStrings.deleteCartDialogTitle,
          style: getLargeStyle(),
        ),
        content: Text(
          AppStrings.deleteCartDialogText,
          style: getSmallStyle(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
                AppStrings.cancel,
                style: getSmallStyle()),
          ),
          FilledButton(
            style: getFilledButtonStyle(),
            onPressed: () => _deleteNote(note),
            child: Text(
              AppStrings.deleteCartOk,
              style: getSmallStyle(
                  color: ColorManager.white
              ),
            ),
          )
        ],
      );
    },
  );
}

_deleteNote(Note note) {
  Get.find<PrintedNotesController>().removeNoteFromCart(note);
  Get.back();
}