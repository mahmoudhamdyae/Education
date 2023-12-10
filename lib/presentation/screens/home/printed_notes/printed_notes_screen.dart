import 'package:flutter/cupertino.dart';

import '../../../resources/strings_manager.dart';

class PrintedNotesScreen extends StatelessWidget {
  const PrintedNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(AppStrings.printedNotes),);
  }
}
