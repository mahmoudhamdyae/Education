import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/widgets/dialogs/choose_marhala_dialog.dart';
import 'package:education/presentation/widgets/wave_background.dart';
import 'package:flutter/material.dart';

import '../../domain/models/home_ui.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required HomeUI item}) : _item = item;

  final HomeUI _item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s16),
      child: Stack(
        children: [
          const WaveBackground(baseColor: ColorManager.secondary, waveColor: ColorManager.secondary),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: InkWell(
            onTap: () {
              if (
                _item.name == AppStrings.recordedCourses ||
                _item.name == AppStrings.examsAndBanks ||
                _item.name == AppStrings.printedNotes
              ) {
                showChooseMarhalaDialog(context, (marhala, saff) {
                  _item.action(marhala, saff);
                });
              } else {
                _item.action('', '');
              }
              },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  _item.icon,
                  height: 120,
                  fit: BoxFit.fill,
                ),
                // const SizedBox(height: AppSize.s16,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _item.name,
                    textAlign: TextAlign.center,
                    style: getLargeStyle(
                      color: ColorManager.white
                    ),
                  ),
                ),
              ],
            ),),
          )
        ],
      ),
    );
  }
}