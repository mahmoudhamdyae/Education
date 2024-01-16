import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';

import '../resources/styles_manager.dart';

class PriceWidget extends StatelessWidget {

  final int price;
  const PriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price د.ك',
      style: getLargeStyle(
        fontWeight: FontWeight.w600,
        color: ColorManager.secondary
      ),
    );
  }
}
