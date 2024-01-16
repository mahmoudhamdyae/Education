import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color, TextDecoration decoration) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration
  );
}

TextStyle getLargeStyle(
    {double fontSize = FontSize.s16, FontWeight fontWeight = FontWeightManager.bold, Color color = ColorManager.black}) {
  return _getTextStyle(fontSize, fontWeight, color, TextDecoration.none);
}

TextStyle getSmallStyle(
    {double fontSize = FontSize.s14, FontWeight fontWeight = FontWeightManager.regular, Color color = ColorManager.black, TextDecoration decoration = TextDecoration.none}) {
  return _getTextStyle(fontSize, fontWeight, color, decoration);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, TextDecoration.none);
}