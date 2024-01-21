import 'package:education/presentation/screens/home/printed_notes/controller/printed_notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../widgets/empty_screen.dart';
import '../../../../widgets/error_screen.dart';
import '../../../../widgets/loading_screen.dart';

class PrintedNotesScreen extends StatelessWidget {
  const PrintedNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed saff: ${Get.arguments['saff']}');
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.printedNotes),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: GetX<PrintedNotesController>(
        init: Get.find<PrintedNotesController>(),
        builder: (PrintedNotesController controller) {
          if (controller.status.isLoading) {
            return const LoadingScreen();
          } else if (controller.status.isError) {
            return ErrorScreen(error: controller.status.errorMessage ?? '');
          } else if (controller.notes.isEmpty){
            return const EmptyScreen(emptyString: AppStrings.noCourses);
          } else {
            final notes = controller.notes;
            return Container();
          }
        },
      ),
    );
  }
}
