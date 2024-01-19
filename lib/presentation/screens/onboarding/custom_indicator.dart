import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {

  final int? dotIndex;
  const CustomIndicator({super.key, required this.dotIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: dotIndex ?? 0,
      count: 3,
      effect:  const SlideEffect(
          spacing:  8.0,
          dotWidth:  10.0,
          dotHeight:  10.0,
          paintStyle:  PaintingStyle.fill,
          dotColor:  Color(0x1af39c12),
          activeDotColor: ColorManager.primary
      ),
    );
  }
}
