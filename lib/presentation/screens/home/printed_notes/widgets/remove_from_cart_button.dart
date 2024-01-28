import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/notes/note.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../controller/printed_notes_controller.dart';

class RemoveFromCartButton extends StatelessWidget {

  final Note note;
  const RemoveFromCartButton({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: getOutlinedButtonStyle(),
        onPressed: () {
          Get.find<PrintedNotesController>().removeNoteFromCart(note);
        },
        child: Text(
          AppStrings.removeFromCart,
          textAlign: TextAlign.center,
          style: getSmallStyle(
            color: ColorManager.secondary,
          ),
        ),
    );
  }
}
