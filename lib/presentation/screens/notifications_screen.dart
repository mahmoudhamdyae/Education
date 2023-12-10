import 'package:flutter/cupertino.dart';

import '../resources/strings_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(AppStrings.bottomBarNotifications),);
  }
}
