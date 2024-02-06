import 'package:education/presentation/screens/home/printed_notes/widgets/add_to_cart_button.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/remove_from_cart_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/notes/note.dart';
import '../../../../../domain/models/package.dart';
import '../controller/printed_notes_controller.dart';

class CartButtonNote extends StatelessWidget {

  final Note note;
  const CartButtonNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child:
        Get.find<PrintedNotesController>().isNoteInCart(note.id.toString()) ? RemoveNoteFromCartButton(note: note,)
            :
        AddToCartButton(noteId: note.id.toString(),)
    );
  }
}

class CartButtonPackage extends StatelessWidget {

  final Package package;
  const CartButtonPackage({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child:
        Get.find<PrintedNotesController>().isNoteInCart(package.id.toString()) ? RemovePackageFromCartButton(package: package,)
            :
        AddToCartButton(noteId: package.id.toString(),)
    );
  }
}
