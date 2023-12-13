import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';

class ExamsAndBanksScreen extends StatelessWidget {
  final List<String>? parameters;
  const ExamsAndBanksScreen({super.key, required this.parameters});

  @override
  Widget build(BuildContext context) {
    debugPrint('passed marhala: ${parameters![0]}');
    debugPrint('passed saff: ${parameters![1]}');
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.examsAndBanks),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: ColorManager.white,),
        ),
      ),
      body: const Center(child: Text(AppStrings.examsAndBanks),),
    );
  }
}
