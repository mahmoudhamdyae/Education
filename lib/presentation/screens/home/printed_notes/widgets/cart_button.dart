import 'package:education/presentation/screens/home/printed_notes/widgets/add_to_cart_button.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/remove_from_cart_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/printed_notes_controller.dart';

class CartButton extends StatelessWidget {

  final String noteId;
  const CartButton({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child:
        // GetX<PrintedNotesController>(
        //   init: Get.find<PrintedNotesController>(),
        //   builder: (PrintedNotesController controller) {
        //     bool inCart = Get.find<PrintedNotesController>().isNoteInCart(noteId);
        //     return
        Get.find<PrintedNotesController>().isNoteInCart(noteId) ? RemoveFromCartButton(noteId: noteId,)
                :
            AddToCartButton(noteId: noteId,)
    // ;
    //         },
        // )
    );
  }
}
