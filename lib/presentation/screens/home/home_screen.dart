import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/home_ui.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/custom_grid_view.dart';
import '../../widgets/wave_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // _buildHeader(),
        Expanded(child: CustomGridView(HomeUI.getItems(context))),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      width: double.infinity,
      height: 120,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppPadding.p16),
        child: const Stack(
          children: [
            WaveBackground(baseColor: ColorManager.primary, waveColor: ColorManager.lightPrimary),
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p20),
                child: Text(
                  AppStrings.header,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppSize.s18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
