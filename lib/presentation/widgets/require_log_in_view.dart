import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:education/presentation/screens/auth/login/widgets/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequireLogInView extends StatelessWidget {
  const RequireLogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.requireLogIn),
        const SizedBox(height: AppSize.s8,),
        OutlinedButton(
            onPressed: () => Get.to(() => const LoginScreen()),
            child: const Text(AppStrings.requireLogInButton)
        )
      ],
    );
  }
}
