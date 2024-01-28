import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/download_note.dart';


class TabMorfaqat extends StatefulWidget {

  final String link;
  const TabMorfaqat({super.key, required this.link});

  @override
  State<TabMorfaqat> createState() => _TabMorfaqatState();
}

class _TabMorfaqatState extends State<TabMorfaqat> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.notes,
                style: getSmallStyle(),
              ),
              IconButton(
                  onPressed: () {
                  },
                icon: SvgPicture.asset(ImageAssets.download),
              )
            ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.pdf,
                  style: getSmallStyle(),
                ),
                IconButton(
                  onPressed: () {
                    downloadNote(context, widget.link, false);
                  },
                  icon: SvgPicture.asset(ImageAssets.download),
                )
              ]
          )
        ],
      ),
    );
  }
}
