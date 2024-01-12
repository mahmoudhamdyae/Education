import 'package:education/domain/repository/repository.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:education/presentation/widgets/require_log_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MeScreen extends StatelessWidget {
  MeScreen({super.key});

  final Repository appPreferences = Get.find<Repository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: appPreferences.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              // User logged in
              return const Center(child: Text(AppStrings.bottomBarMe),);
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
