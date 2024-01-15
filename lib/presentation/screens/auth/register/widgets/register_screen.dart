import 'package:education/presentation/screens/auth/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
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
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
      key: scaffoldKey,
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        iconTheme: const IconThemeData(color: ColorManager.primary),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: GetX<RegisterController>(
          builder: (RegisterController controller) {
            return  Form(
                key: formState,
                child: ListView(
                  children: [
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
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: AppStrings.usernameHint,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
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
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: AppStrings.phoneHint,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    // Marhala Drop Down
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      isExpanded: true,
                      value: controller.marahel.first,
                      onChanged: (newValue) {
                        controller.chooseMarhala(newValue!);
                      },
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
                      ),
                      isExpanded: true,
                      hint: Text(controller.selectedSaff.value),
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
                          hintText: AppStrings.passwordConfirmHint,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(
                      height: AppSize.s18,
                    ),
                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: FilledButton(
                        onPressed: () async {
                          await signUp();
                        },
                        child: const Text(
                          AppStrings.register,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s18,
                    ),
                    // Navigate To Login Screen
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Row(
                        children: [
                          Text(AppStrings.alreadyHaveAccount1,
                              style: TextStyle(color: ColorManager.black)),
                          Text(AppStrings.alreadyHaveAccount2,
                              style: TextStyle(color: ColorManager.blue)),
                        ],
                      ),
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}