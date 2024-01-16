import 'package:education/domain/models/courses/course.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';

class BuyButton extends StatelessWidget {

  final Course course;
  const BuyButton({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              )
          ),
          backgroundColor: MaterialStateProperty.all(ColorManager.primary),
        ),
        onPressed: () {
        },
        child: Text(
          AppStrings.buy,
          style: getSmallStyle(
            color: ColorManager.white,
          ),
        )
    );
  }
}
