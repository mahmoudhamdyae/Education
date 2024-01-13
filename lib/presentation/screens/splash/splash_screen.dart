import 'dart:async';

import 'package:education/domain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../main_screen.dart';
import '../start/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  final Repository appPreferences = Get.find<Repository>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 0), () =>
        _goNext()
    );
  }

  _goNext() async {
    if (appPreferences.isUserLoggedIn()) {
      // Navigate to main screen
      Get.offAll(MainScreen());
    } else {
      // Navigate to login screen
      Get.offAll(const StartScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.primary,
      body:
      Center(child: Image(image: AssetImage(ImageAssets.splashLogo), width: 200,)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
