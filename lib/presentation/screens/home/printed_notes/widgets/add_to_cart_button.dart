import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/cart/cart.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: getOutlinedButtonStyle(),
        onPressed: () {
          Get.find<CartController>().addToCart(Cart());
        },
        child: Text(
          AppStrings.addToCart,
          style: getSmallStyle(),
        )
    );
  }
}
