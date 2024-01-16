import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/fav/widgets/fav_tabs.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
          Text(
            AppStrings.saves,
            style: getLargeStyle(),
          ),
          const Expanded(child: FavTabs()),
        ],
      ),
    );
  }
}
