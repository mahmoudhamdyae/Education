import 'package:flutter/cupertino.dart';

import '../../core/app_prefs.dart';
import '../../core/di.dart';
import '../resources/strings_manager.dart';
import '../widgets/require_log_in_view.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final AppPreferences appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: appPreferences.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              // User logged in
              return const Center(child: Text(AppStrings.bottomBarNotifications),);
            } else {
              // User not logged in
              return const RequireLogInView();
            }
          } else {
            return Container();
          }
        }
    );
  }
}
