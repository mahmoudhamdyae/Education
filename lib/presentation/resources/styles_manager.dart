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

ButtonStyle getFilledButtonStyle() {
  return ButtonStyle(
    shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        )
    ),
    backgroundColor: MaterialStateProperty.all(ColorManager.primary),
  );
}

ButtonStyle getOutlinedButtonStyle() {
  return OutlinedButton.styleFrom(
    side: const BorderSide(
      width: 1.0,
      color: ColorManager.primary,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}

InputDecoration getTextFieldDecoration({
  required String hint,
  required IconData prefixIcon,
  IconData? suffixIcon,
  required Function onPressed
}) {
  return InputDecoration(
      prefixIcon: Icon(prefixIcon, color: const Color(0xff545454),),
      suffixIcon: IconButton(
        icon: Icon(
          suffixIcon,
          color: const Color(0xff545454),
        ),
        onPressed: () {
          onPressed();
        },
      ),
      hintText: hint,
      border: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: ColorManager.lightGrey),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      )
  );
}