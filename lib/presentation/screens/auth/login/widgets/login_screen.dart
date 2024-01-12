import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/screens/auth/login/controller/login_controller.dart';
import 'package:education/presentation/screens/auth/register/widgets/register_screen.dart';
import 'package:education/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/dialogs/error_dialog.dart';
import '../../../../widgets/dialogs/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  logIn() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      showLoading(context);
      final controller = Get.find<LoginController>();
      controller.login().then((value) {
        if (controller.status == RxStatus.loading()) {
          showLoading(context);
        } else if (controller.status == RxStatus.error()) {
          showError(context, controller.status.errorMessage.toString(), () {});
        }
        Get.offAll(MainScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<LoginController>(
        init: Get.find<LoginController>(),
        builder: (LoginController controller) {
          return ListView(
            children: [
              // Lottie Image
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Lottie.asset(JsonAssets.login)
              ),
              const SizedBox(height: AppSize.s40),
              Form(
                key: formState,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Column(
                    children: [
                      // Phone Number Edit Text
                      TextFormField(
                        controller: controller.phone,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val.toString().isNotEmpty) {
                            return null;
                          }
                          return AppStrings.mobileNumberInvalid;
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: AppStrings.phoneHint,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1))),
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      // Password Edit Text
                      TextFormField(
                        controller: controller.password,
                        textInputAction: TextInputAction.done,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return AppStrings.passwordInvalid;
                          }
                          return null;
                        },
                        obscureText: controller.obscureText.value,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(controller.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                controller.toggleSecurePassword();
                              },
                            ),
                            hintText: AppStrings.passwordHint,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 1))),
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: FilledButton(
                          onPressed: () async {
                            await logIn();
                          },
                          child: const Text(
                            AppStrings.login,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      // Navigate to Register Screen
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.to(const RegisterScreen()),
                            child: const Row(
                              children: [
                                Text(AppStrings.registerText1,
                                    style: TextStyle(color: ColorManager.black)),
                                Text(AppStrings.registerText2,
                                    style: TextStyle(color: ColorManager.blue)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
