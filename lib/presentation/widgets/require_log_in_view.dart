import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../resources/routes_manager.dart';

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
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pushNamed(Routes.loginRoute);
            },
            child: const Text(AppStrings.requireLogInButton)
        )
      ],
    );
  }
}
