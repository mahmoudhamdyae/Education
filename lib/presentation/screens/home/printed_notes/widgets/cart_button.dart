import 'package:education/presentation/screens/home/printed_notes/widgets/add_to_cart_button.dart';
import 'package:flutter/cupertino.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        child: AddToCartButton()
    );
  }
}
