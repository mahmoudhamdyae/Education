import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              child: Image.asset(
                ImageAssets.start,
                fit: BoxFit.cover,
              )
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.loginRoute);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p8),
                          child: Text(
                              AppStrings.loginButton,
                            style: TextStyle(
                                fontSize: AppSize.s20,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),
                    const SizedBox(height: AppSize.s16),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p8),
                          child: Text(
                            AppStrings.loginAsAGuestButton,
                            style: TextStyle(
                                fontSize: AppSize.s20,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.white
                            ),
                          ),
                        )
                    ),
                    const SizedBox(height: AppSize.s16,)
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
