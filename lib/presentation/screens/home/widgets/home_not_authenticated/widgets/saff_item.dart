import 'package:education/presentation/screens/home/widgets/home_not_authenticated/controller/home_not_authenticated_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../resources/styles_manager.dart';

class SaffItem extends StatelessWidget {

  final String saff;
  const SaffItem({super.key, required this.saff});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<HomeNotAuthenticatedController>().saff.value = saff;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            shape: BoxShape.rectangle,
            border: Border.all(color: const Color(0xffF2F2F2))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            saff,
            style: getSmallStyle(),
          ),
        ),
      ),
    );
  }
}
