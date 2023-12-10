import 'package:flutter/material.dart';

import '../../core/app_prefs.dart';
import '../../core/di.dart';
import '../../data/remote/account_service.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/dialogs/error_dialog.dart';
import '../widgets/dialogs/loading_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterScreen> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final AccountService _accountService = instance<AccountService>();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();

      try {
        showLoading();
        await _accountService.register(nameController.text, numberController.text, passController.text)
            .then((userCredential) {
          _accountService.logIn(numberController.text, passController.text).then((value) {
            _appPreferences.setUserLoggedIn();
            Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
          });
        });
      } on Exception catch (e) {
        Navigator.of(context).pop();
        showError(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        iconTheme: const IconThemeData(color: ColorManager.primary),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Form(
            key: formState,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
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
                      hintText: AppStrings.username,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: numberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: (val) {
                    if (val.toString().length == 11 &&
                        val.toString().startsWith("01")) {
                      return null;
                    }
                    return AppStrings.mobileNumberInvalid;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: AppStrings.phone,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: passController,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.passwordError;
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _toggle();
                        },
                      ),
                      hintText: AppStrings.password,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                TextFormField(
                  controller: confirmPassController,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val != passController.text) {
                      return AppStrings.passwordConfirmInvalid;
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _toggle();
                        },
                      ),
                      hintText: AppStrings.passwordConfirm,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1))),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
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
            )),
      ),
    );
  }
}