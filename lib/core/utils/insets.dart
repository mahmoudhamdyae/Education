import 'package:flutter/cupertino.dart';

bool isWide(BuildContext context) {
  return MediaQuery.of(context).size.width >= 600;
}