import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/cart/cart.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../cart/controller/cart_controller.dart';
import '../controller/printed_notes_controller.dart';

class RemoveFromCartButton extends StatelessWidget {

  final String noteId;
  const RemoveFromCartButton({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: getOutlinedButtonStyle(),
        onPressed: () {
          Get.find<PrintedNotesController>().removeNoteFromCart(noteId);
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
