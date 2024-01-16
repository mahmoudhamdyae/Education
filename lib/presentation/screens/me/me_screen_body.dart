import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/auth/login/widgets/login_screen.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/userImage.dart';
import 'package:education/presentation/screens/me/me_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeScreenBody extends StatelessWidget {
  const MeScreenBody({super.key});

  _signOut() {
    Get.find<AuthController>().signOut()
        .then((value) => Get.offAll(() => const LoginScreen()));
  }

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
        MeItem(
            icon: ImageAssets.editProfile,
            title: AppStrings.editProfile,
            action: () {}
        ),
        MeItem(
            icon: ImageAssets.baqat,
            title: AppStrings.baqat,
            action: () {}
        ),
        MeItem(
            icon: ImageAssets.helpCenter,
            title: AppStrings.helpCenter,
            action: () {}
        ),
        MeItem(
            icon: ImageAssets.whoAreWe,
            title: AppStrings.whoAreWe,
            action: () {}
        ),
        MeItem(
            icon: ImageAssets.delAccount,
            title: AppStrings.delAccount,
            action: () {}
        ),
        MeItem(
            icon: ImageAssets.signOut,
            title: AppStrings.signOut,
            action: _signOut
        )
      ],
    );
  }
}
