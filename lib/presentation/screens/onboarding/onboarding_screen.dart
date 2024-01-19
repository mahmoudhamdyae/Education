import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/screens/auth/login/widgets/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_indicator.dart';
import 'custom_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
                child: Text(
                  pageController!.hasClients
                      ? (pageController?.page == 2 ? '' : AppStrings.onboardingSkip)
                      : AppStrings.onboardingSkip,
                  style: getLargeStyle(
                    fontSize: AppSize.s18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0,),
          Expanded(
            child: CustomPageView(
              pageController: pageController,
            ),
          ),
          CustomIndicator(
            dotIndex: pageController!.hasClients ? pageController?.page?.toInt() : 0,
          ),
          const SizedBox(height: 64.0,),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilledButton(
                style: getFilledButtonStyle(),
                onPressed: () {
                  if (pageController!.page! < 2) {
                    pageController?.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    Get.to(() => const LoginScreen());
                  }
                },
                child: Text(pageController!.hasClients
                    ? (pageController?.page == 2 ? AppStrings.onboardingStart : AppStrings.onboardingNext)
                    : AppStrings.onboardingNext,
                )
              ),
            ),
          ),
          const SizedBox(height: 24.0,),
        ],
      ),
    );
  }
}
