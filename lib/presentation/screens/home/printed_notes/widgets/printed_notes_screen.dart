import 'package:education/presentation/screens/home/printed_notes/controller/printed_notes_controller.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/strings_manager.dart';
import '../../../../widgets/empty_screen.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/top_bar.dart';

class PrintedNotesScreen extends StatelessWidget {
  const PrintedNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed saff: ${Get.arguments['saff']}');
    Get.find<PrintedNotesController>().getNotes();
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          TopBar(title: Get.arguments['saff'],),
          GetX<PrintedNotesController>(
            init: Get.find<PrintedNotesController>(),
            builder: (PrintedNotesController controller) {
              if (controller.status.isLoading) {
                return const LoadingScreen();
              } else if (controller.status.isError) {
                return ErrorScreen(error: controller.status.errorMessage ?? '');
              } else if (controller.notes.isEmpty){
                return const EmptyScreen(emptyString: AppStrings.noNotes);
              } else {
                final notes = controller.notes;
                final packages = controller.packages;
                return NotesScreen(notes: notes, packages: packages,);
              }
            },
          ),
        ],
      ),
    );
  }
}
