import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/widgets/require_log_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Get.find<AuthController>().isUserLoggedIn() ?
      const Center(child: Text(AppStrings.bottomBarCart),) :
      const RequireLogInView();
  }
}
