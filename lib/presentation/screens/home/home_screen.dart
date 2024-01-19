import 'package:education/domain/models/slider.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/home/widgets/swiper.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/home_ui.dart';
import '../../widgets/custom_grid_view.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName,),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            SwiperWidget(sliders: SliderModel.getData()),
            CustomGridView(HomeUI.getItems(context)),
          ],
        )
    );
  }
}
