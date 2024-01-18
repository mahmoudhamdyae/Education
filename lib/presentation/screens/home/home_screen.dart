import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/home/widgets/baqat.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/home_app_bar.dart';
import 'package:education/presentation/screens/home/widgets/home_not_authenticated/widgets/home_not_authenticated.dart';
import 'package:education/presentation/screens/home/widgets/home_screen_courses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeAppBar(),
        const Baqat(),
        Get.find<AuthController>().isUserLoggedIn() ?
        const HomeScreenCourses()
            :
        const HomeNotAuthenticated()
      ],
    );
  }
}
