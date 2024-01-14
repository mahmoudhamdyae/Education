import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/account_column.dart';
import 'package:education/presentation/screens/home/widgets/home_app_bar/userImage.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
          right: 16.0,
          left: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const UserImage(),
          const SizedBox(width: 8,),
          const AccountColumn(),
          Expanded(child: Container()),
          // Search Button
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: ColorManager.secondary)
            ),
            child: IconButton(
              onPressed: () {
                // Search
              },
              icon: const Icon(
                Icons.search,
                size: 15,
                color: ColorManager.secondary,
              ),
            ),
          ),
          const SizedBox(width: 8,),
          // Notifications Button
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: ColorManager.secondary)
            ),
            child: IconButton(
              onPressed: () {
                // Search
              },
              icon: const Icon(
                Icons.notifications,
                size: 15,
                color: ColorManager.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
