import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/cart/cart.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../cart/controller/cart_controller.dart';

class RemoveFromCartButton extends StatelessWidget {
  const RemoveFromCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: getOutlinedButtonStyle(),
        onPressed: () {
          Get.find<CartController>().removeFromCart(Cart());
        },
        child: Text(
          AppStrings.removeFromCart,
          textAlign: TextAlign.center,
          style: getSmallStyle(),
        )
    );
  }
}
