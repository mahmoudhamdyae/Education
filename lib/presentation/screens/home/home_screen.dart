import 'package:education/domain/models/slider.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/home/widgets/baqat.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/home_app_bar.dart';
import 'package:education/presentation/screens/home/widgets/home_not_authenticated/widgets/home_not_authenticated.dart';
import 'package:education/presentation/screens/home/widgets/home_screen_courses.dart';
import 'package:education/presentation/screens/home/widgets/swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/models/home_ui.dart';
import '../../widgets/custom_grid_view.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [
    //     HomeAppBar(),
    //     const Baqat(),
    //     Get.find<AuthController>().isUserLoggedIn() ?
    //     const HomeScreenCourses()
    //         :
    //     const HomeNotAuthenticated()
    //   ],
    // );
    return Scaffold(
        appBar: AppBar(
          title: Text(
              AppStrings.appName
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            SwiperWidget(sliders: SliderModel.getData()),
            CustomGridView(HomeUI.getItems(context)),
          ],
        )
    );
  }
}
