import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:get/get.dart';

import '../presentation/resources/color_manager.dart';
import '../presentation/resources/strings_manager.dart';
import 'constants.dart';

final _flutterMediaDownloaderPlugin = MediaDownload();

void downloadNote(BuildContext context, String link, bool isNote) async {
  String url = '${Constants.baseUrl}filedownload/';
  if (isNote) {
    url += 'books/';
  }
  url += link;
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