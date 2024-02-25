import 'package:education/core/utils/insets.dart';
import 'package:education/presentation/resources/color_manager.dart';
import 'package:education/presentation/resources/styles_manager.dart';
import 'package:education/presentation/screens/auth/login/controller/login_controller.dart';
import 'package:education/presentation/screens/auth/register/widgets/register_screen.dart';
import 'package:education/presentation/screens/main_screen.dart';
import 'package:education/presentation/screens/subscription/controller/subscription_controller.dart';
import 'package:education/presentation/widgets/coding_site_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/check_version.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/font_manager.dart';
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

  @override
  void initState() {
    super.initState();
    try {
      versionCheck(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  logIn() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      showLoading(context);
      final LoginController controller = Get.find<LoginController>();
      controller.login().then((value) {
        if (controller.status.isError) {
          Get.back();
          showError(context, controller.status.errorMessage.toString(), () {});
        } else {
          SubscriptionController controller = Get.find<SubscriptionController>();
          controller.isSubscribedAtOneSubjectAtLeast().then((value) =>
              Get.offAll(() => MainScreen(selectedIndex: value ? 1 : 0,))
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<LoginController>(
        init: Get.find<LoginController>(),
        builder: (LoginController controller) {
          return isWide(context) ? _buildTwoColumn(controller) : _buildOneColumn(controller);
        },
      ),
    );
  }

  ListView _buildOneColumn(LoginController controller) {
    return ListView(
          children: [
            _buildTopBar(),
            _buildImage(),
            const SizedBox(height: AppSize.s40),
            _buildForm(controller),
          ],
        );
  }

  Widget _buildTwoColumn(LoginController controller) {
    return ListView(
      children: [
        _buildTopBar(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: _buildImage(),
            ),
            const SizedBox(width: 16.0),
            Expanded(
                flex: 3,
                child: _buildForm(controller),
            ),
          ],
        ),
      ],
    );
  }

  Form _buildForm(LoginController controller) {
    return Form(
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

                      style: getLargeStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.grey,
                      ),
                      decoration: getTextFieldDecoration(
                          hint: AppStrings.phoneHint,
                          onPressed: () { },
                          prefixIcon: Icons.phone_android,
                      ),
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
                      style: getLargeStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.grey,
                      ),
                      decoration: getTextFieldDecoration(
                          hint: AppStrings.passwordHint,
                          onPressed: () {
                            controller.toggleSecurePassword();
                          },
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: controller.obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: FilledButton(
                        style: getFilledButtonStyle(),
                        onPressed: () async {
                          await logIn();
                        },
                        child: Text(
                          AppStrings.login,
                          style: getSmallStyle(
                            color: ColorManager.white
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s16,
                    ),
                    // Navigate to Register Screen
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Get.to(const RegisterScreen()),
                          child: Row(
                            children: [
                              Text(
                                  AppStrings.registerText1,
                                  style: getLargeStyle(
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.black,
                                  )
                              ),
                              Text(
                                  AppStrings.registerText2,
                                  style: getLargeStyle(
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.secondary,
                                      decoration: TextDecoration.underline
                                  )
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Login as a guest Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: getOutlinedButtonStyle(),
                        onPressed: () {
                          Get.to(const MainScreen(selectedIndex: 0,));
                        },
                        child: Text(
                          AppStrings.loginAsAGuestButton,
                          style: getSmallStyle(
                            color: ColorManager.primary
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0,),
                    const CodingSiteWidget(),
                  ],
                ),
              ),
            );
  }

  Image _buildImage() {
    return Image.asset(
              ImageAssets.login
            );
  }

  Center _buildTopBar() {
    return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  AppStrings.login,
                  style: getLargeStyle(),
                ),
              ),
            );
  }
}
