import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class ServerDownScreen extends StatelessWidget {

  const ServerDownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageAssets.serverDown,
              height: AppSize.s190,
            ),
            const SizedBox(height: AppSize.s40,),
            const Text(
              AppStrings.serverDown,
              style: TextStyle(
                color: ColorManager.error,
                fontWeight: FontWeight.w500,
                fontSize: FontSize.s16,
              ),
            ),
          ],
        )
    );
  }
}
