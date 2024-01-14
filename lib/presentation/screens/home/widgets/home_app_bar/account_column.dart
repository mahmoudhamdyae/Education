import 'package:flutter/cupertino.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';

class AccountColumn extends StatelessWidget {

  const AccountColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcome,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorManager.secondary,
          ),
        ),
        Text(
          AppStrings.pleaseLogin,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
