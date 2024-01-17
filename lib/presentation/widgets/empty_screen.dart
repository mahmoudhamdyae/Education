import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';

import '../resources/assets_manager.dart';

class EmptyScreen extends StatelessWidget {

  final String emptyString;
  const EmptyScreen({super.key, required this.emptyString});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.empty,
            height: AppSize.s190,
          ),
          const SizedBox(height: AppSize.s40,),
          Text(
            emptyString,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: FontSize.s16,
            ),
          ),
        ],
      ),
    );
  }
}
