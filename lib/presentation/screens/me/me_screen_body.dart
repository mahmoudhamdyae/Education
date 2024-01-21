import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/user_image.dart';
import 'package:education/presentation/screens/me/me_item.dart';
import 'package:education/presentation/screens/me/sign_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeScreenBody extends StatelessWidget {
  const MeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              AppStrings.bottomBarMe,
              style: getLargeStyle(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const UserImage(),
              const SizedBox(width: 8.0,),
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
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(color: Color(0xffE4E4E4),),
        ),
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
            action: () => showSignOutDialog(context)
        )
      ],
    );
  }
}
