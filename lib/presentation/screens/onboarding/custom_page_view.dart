import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {

  final PageController? pageController;
  const CustomPageView({Key? key,@required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController ,
      children: [
        Column(
          children: [
            Image.asset(
                ImageAssets.onboarding1,
            ),
            const SizedBox(height: 40.0,),
            Text(
              AppStrings.onboarding1,
              style: getLargeStyle(),
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
                ImageAssets.onboarding2,
            ),
            const SizedBox(height: 40.0,),
            Text(
              AppStrings.onboarding2,
              style: getLargeStyle(),
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
                ImageAssets.onboarding3,
            ),
            const SizedBox(height: 40.0,),
            Text(
              AppStrings.onboarding3,
              style: getLargeStyle(),
            )
          ],
        ),
      ],
    );
  }
}