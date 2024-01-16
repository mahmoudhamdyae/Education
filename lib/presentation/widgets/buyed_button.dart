import 'package:education/domain/models/courses/course.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';

class BuyedButton extends StatelessWidget {

  final Course course;
  const BuyedButton({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: FilledButton(
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
            AppStrings.buyed,
            style: getSmallStyle(
              color: ColorManager.white,
            ),
          )
      ),
    );
  }
}
