import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/userImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeScreenBody extends StatelessWidget {
  const MeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            AppStrings.bottomBarMe,
            style: getLargeStyle(),
          ),
        ),
        Row(
          children: [
            const UserImage(),
            Column(
              children: [
                Text(
                  Get.find<AuthController>().getUserName(),
                  style: getLargeStyle(
                    color: ColorManager.secondary
                  ),
                ),
                Text(
                  Get.find<AuthController>().getPhoneNumber(),
                  style: getSmallStyle(),
                ),
              ],
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
