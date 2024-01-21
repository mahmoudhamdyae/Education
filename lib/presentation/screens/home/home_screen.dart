import 'package:education/domain/models/slider.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/home_app_bar.dart';
import 'package:education/presentation/screens/home/widgets/swiper.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/home_ui.dart';
import '../../widgets/custom_grid_view.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text(AppStrings.appName,),
        // ),
        body: ListView(
          children: [
            HomeAppBar(),
            ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                CustomGridView(HomeUI.getItems(context)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    AppStrings.baqat3,
                    style: getLargeStyle(),
                  ),
                ),
                SwiperWidget(sliders: SliderModel.getBaqat(), isTeacher: false,),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                  child: Text(
                    AppStrings.teachers,
                    style: getLargeStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: SwiperWidget(sliders: SliderModel.getTeachers(), isTeacher: true,),
                ),
              ],
            ),
          ],
        )
    );
  }
}
