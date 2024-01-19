import 'package:education/presentation/screens/auth/auth_controller.dart';
import 'package:education/presentation/screens/me/me_screen_body.dart';
import 'package:education/presentation/widgets/require_log_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Get.find<AuthController>().isUserLoggedIn() ?
      const MeScreenBody() :
      const RequireLogInView();
  }
}
