import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../widgets/top_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          TopBar(title: AppStrings.cart,),
        ],
      ),
    );
  }
}
