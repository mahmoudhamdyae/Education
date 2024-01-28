import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/models/notes/note.dart';
import '../../../widgets/empty_screen.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/top_bar.dart';
import '../../home/printed_notes/controller/printed_notes_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PrintedNotesController>().getAllNotes();
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const TopBar(title: AppStrings.cart,),
          GetX<PrintedNotesController>(
            init: Get.find<PrintedNotesController>(),
            builder: (PrintedNotesController controller) {
              List<Note> notes = controller.notes;
              if (controller.status.isLoading) {
                return const LoadingScreen();
              } else if (controller.status.isError) {
                return ErrorScreen(error: controller.status.errorMessage ?? '');
              } else if (controller.notes.isEmpty){
                return const EmptyScreen(emptyString: AppStrings.noCart);
              }
              return



                GridView.count(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  crossAxisCount: (MediaQuery.of(context).size.width ~/ 160).toInt(),
                  childAspectRatio: (1/1.6),
                  children: List.generate(notes.length, (index) {
                    return NoteItem(note: notes[index]);
                  }),
                );
            },)
        ],
      ),
    );
  }
}
