import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

class PrintedNotesScreen extends StatelessWidget {
  final String saff;
  const PrintedNotesScreen({super.key, required this.saff});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed saff: $saff');
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
      body: const Center(child: Text(AppStrings.printedNotes),),
    );
  }
}
