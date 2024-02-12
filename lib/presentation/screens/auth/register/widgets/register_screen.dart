import 'package:education/presentation/resources/font_manager.dart';
import 'package:education/presentation/screens/auth/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/coding_site_widget.dart';
import '../../../../widgets/dialogs/error_dialog.dart';
import '../../../../widgets/dialogs/loading_dialog.dart';
import '../../../main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterScreen> {

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      final RegisterController controller = Get.find<RegisterController>();

      if (controller.selectedMarhala.value == AppStrings.marhalaHint) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.marhalaInvalid)));
        return;
      }

      if (controller.selectedSaff.value == AppStrings.saff) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.saffInvalid)));
        return;
      }

      showLoading(context);
      await controller.register().then((userCredential) {
        if (controller.status.isError) {
          Get.back();
          showError(context, controller.status.errorMessage.toString(), () {});
        } else {
          Get.offAll(() => const MainScreen());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: GetX<RegisterController>(
          builder: (RegisterController controller) {
            return  Form(
                key: formState,
                child: ListView(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          AppStrings.registerText2,
                          style: getLargeStyle(),
                        ),
                      ),
                    ),
                    Image.asset(
                        ImageAssets.register
                    ),
                    const SizedBox(height: 16.0,),
                    // User Name Edit Text
                    TextFormField(
                      controller: controller.userName,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return AppStrings.userNameInvalid;
                        }
                        return null;
                      },
                      style: getLargeStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.grey,
                      ),
                      decoration: getTextFieldDecoration(
                          hint: AppStrings.usernameHint,
                          prefixIcon: null,
                          onPressed: () { },
                          suffixIcon: Icons.person_outline_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    // Phone Number Edit Text
                    TextFormField(
                      controller: controller.phone,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val.toString().length == 8) {
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
                        prefixIcon: null,
                        onPressed: () {},
                        suffixIcon: Icons.phone_android,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    // Marhala Drop Down
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(right: 8.0, left: 8.0),
                      ),
                      isExpanded: true,
                      value: controller.marahel.first,
                      onChanged: (newValue) {
                        controller.chooseMarhala(newValue!);
                      },
                      style: getLargeStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.grey,
                      ),
                      items: controller.marahel.map((marhala) {
                        return DropdownMenuItem(
                          value: marhala,
                          child: Text(marhala),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    // Saff Drop Down
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(right: 8.0, left: 8.0),
                      ),
                      isExpanded: true,
                      style: getLargeStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.grey,
                      ),
                      value: controller.sfoof.first,
                      onChanged: (
                          controller.selectedSaff.value == AppStrings.qodoratMarhala ||
                              controller.selectedSaff.value == AppStrings.toeflMarhala ||
                              controller.selectedSaff.value == AppStrings.ieltsMarhala
                      ) ? null : (newValue) {
                        controller.chooseSaff(newValue.toString());
                      },
                      items: controller.sfoof.map((saff) {
                        return DropdownMenuItem(
                          value: saff,
                          child: Text(saff),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    // Password Edit Text
                    TextFormField(
                      controller: controller.password,
                      textInputAction: TextInputAction.next,
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
                          prefixIcon: null,
                          suffixIcon: controller.obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    // Repeat Password Edit Text
                    TextFormField(
                      controller: controller.confirmPassword,
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        if (val != controller.password.text) {
                          return AppStrings.passwordConfirmInvalid;
                        }
                        return null;
                      },
                      obscureText: controller.obscureText.value,
                      style: getLargeStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.grey,
                      ),
                      decoration: getTextFieldDecoration(
                          hint: AppStrings.passwordConfirmHint,
                          onPressed: () {
                            controller.toggleSecurePassword();
                          },
                          prefixIcon: null,
                          suffixIcon: controller.obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s18,
                    ),
                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: FilledButton(
                        style: getFilledButtonStyle(),
                        onPressed: () async {
                          await signUp();
                        },
                        child: const Text(
                          AppStrings.registerTextButton,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              AppStrings.alreadyHaveAccount1,
                              style: getLargeStyle(
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          Text(
                              AppStrings.alreadyHaveAccount2,
                              style: getLargeStyle(
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.secondary,
                                  decoration: TextDecoration.underline
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: getOutlinedButtonStyle(),
                        onPressed: () {
                          Get.to(const MainScreen());
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
                )
            );
          },
        ),
      ),
    );
  }
}