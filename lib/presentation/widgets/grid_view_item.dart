import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required String itemName, required IconData itemIcon}) : _itemName = itemName, _itemIcon = itemIcon;

  final String _itemName;
  final IconData _itemIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s60),
        ),
        child: InkWell(
          onTap: () { },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(_itemIcon, color: ColorManager.fabBackground, size: AppSize.s40,),
              const SizedBox(height: AppSize.s16,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _itemName,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
