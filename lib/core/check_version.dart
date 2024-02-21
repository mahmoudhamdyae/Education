import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'constants.dart';
import 'launch_site.dart';

versionCheck(context) async {
  debugPrint('--------------------- remote');
  // Get Current installed version of app
  final PackageInfo info = await PackageInfo.fromPlatform();
  var s = info.version.trim();
  debugPrint('--------------------- remote $s');
  double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));
  debugPrint('--------------------- remote $currentVersion');

  // Get Latest version info from firebase config
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  try {
    // Using default duration to force fetching from remote server.
    // await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    // await remoteConfig.activateFetched();
    await remoteConfig.activate();
    String forceUpdateCurrentVersion = '1.0.6';//remoteConfig.getString('force_update_current_version');
    debugPrint('--------------------- remote2 $forceUpdateCurrentVersion');
    double newVersion = double.parse(forceUpdateCurrentVersion
        .trim()
        .replaceAll(".", ""));
    debugPrint('--------------------- remote $newVersion');
    debugPrint('--------------------- current $currentVersion');
    if (newVersion > currentVersion) {
      _showVersionDialog(context);
    }
  } on Exception catch (exception) {
    // Fetch throttled.
    debugPrint(exception.toString());
  } catch (exception) {
    debugPrint('Unable to fetch remote config. Cached or default values will be used');
  }
}

_showVersionDialog(context) async {
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String title = AppStrings.updateDialogTitle;
      String message = AppStrings.updateDialogMessage;
      String btnLabel = AppStrings.updateDialogButtonLabel;
      String btnLabelCancel = AppStrings.updateDialogButtonLabelCancel;
      return AlertDialog(
        title: Text(
          title,
          style: getLargeStyle(),
        ),
        content: Text(
          message,
          style: getSmallStyle(),
        ),
        actions: [
          MaterialButton(
            child: Text(
              btnLabel,
              style: getLargeStyle(),
            ),
            onPressed: () => GetPlatform.isAndroid ?
            launchSite(Constants.playStoreUrl)
                :
            launchSite(Constants.appStoreUrl),
          ),
          MaterialButton(
            child: Text(
              btnLabelCancel,
              style: getSmallStyle(),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}