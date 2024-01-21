import 'package:education/presentation/screens/cart/controller/cart_controller.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/add_to_cart_button.dart';
import 'package:education/presentation/screens/home/printed_notes/widgets/remove_from_cart_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../domain/models/cart/cart.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: GetX<CartController>(
          init: Get.find<CartController>(),
          builder: (CartController controller) {
            Cart cart = Cart();
            bool inCart = controller.isInCart(cart);
            return inCart ? const RemoveFromCartButton()
                :
            const AddToCartButton();
            },
        )
    );
  }
}
