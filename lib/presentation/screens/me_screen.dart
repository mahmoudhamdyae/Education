import 'package:education/core/di.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../core/app_prefs.dart';

class MeScreen extends StatelessWidget {
  MeScreen({super.key});

  final AppPreferences appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: appPreferences.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return const Center(child: Text(AppStrings.bottomBarMe),);
            } else {
              return const Center(child: Text("You should log in"),);
            }
          } else {
            return Container();
          }
        }
    );
  }
}
