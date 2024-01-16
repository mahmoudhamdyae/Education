import 'package:education/presentation/resources/assets_manager.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants.dart';
import '../../../resources/color_manager.dart';

class TabMorfaqat extends StatefulWidget {

  final String link;
  const TabMorfaqat({super.key, required this.link});

  @override
  State<TabMorfaqat> createState() => _TabMorfaqatState();
}

class _TabMorfaqatState extends State<TabMorfaqat> {

  final _flutterMediaDownloaderPlugin = MediaDownload();

  void _downloadNote(String link) async {
    String url = '${Constants.baseUrl}filedownload/$link';
    debugPrint('url: $url');
    Get.showSnackbar(
      const GetSnackBar(
        title: null,
        message: AppStrings.noteDownloading,
        icon: Icon(Icons.download, color: ColorManager.white,),
        duration: Duration(seconds: 3),
      ),
    );
    _flutterMediaDownloaderPlugin.downloadMedia(context, url).catchError((error) {
      if (Get.isSnackbarOpen) Get.back();
      Get.showSnackbar(
        const GetSnackBar(
          title: null,
          message: AppStrings.noteDownloadError,
          icon: Icon(Icons.error, color: ColorManager.white,),
          duration: Duration(seconds: 3),
        ),
      );
    }).then((value) {
      if (Get.isSnackbarOpen) Get.back();
      Get.showSnackbar(
        const GetSnackBar(
          title: null,
          message: AppStrings.noteDownloaded,
          icon: Icon(Icons.download_done, color: ColorManager.white,),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

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
                    _downloadNote(widget.link);
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
