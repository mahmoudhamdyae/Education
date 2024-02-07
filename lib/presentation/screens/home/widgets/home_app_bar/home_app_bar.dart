import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/auth/login/widgets/login_screen.dart';
import 'package:education/presentation/screens/cart/widgets/cart_screen.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/account_column.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/user_image.dart';
import 'package:education/presentation/screens/notifications/widgets/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth/auth_controller.dart';

class HomeAppBar extends StatelessWidget {

  final AuthController _controller = Get.find<AuthController>();
  HomeAppBar({super.key});

  void _login() {
    if (_controller.isUserLoggedIn()) {
      // Navigate to Profile
    } else {
      // Navigate to login screen
      Get.to(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
          right: 16.0,
          left: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(onTap: _login, child: const UserImage()),
          const SizedBox(width: 8,),
          InkWell(onTap: _login, child: AccountColumn()),
          Expanded(child: Container()),
          // Cart Button
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: ColorManager.secondary)
            ),
            child: IconButton(
              onPressed: () {
                Get.to(() => const CartScreen());
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 15,
                color: ColorManager.secondary,
              ),
            ),
          ),
          const SizedBox(width: 8.0,),
          // Notifications Button
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: ColorManager.secondary)
            ),
            child: IconButton(
              onPressed: () {
                Get.to(() => NotificationsScreen());
              },
              icon: const Icon(
                Icons.notifications,
                size: 15,
                color: ColorManager.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
