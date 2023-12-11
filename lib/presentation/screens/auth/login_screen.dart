import 'package:education/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/app_prefs.dart';
import '../../../core/di.dart';
import '../../../data/remote/account_service.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final AccountService _accountService = instance<AccountService>();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  logIn() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        showLoading(context);
        await _accountService.logIn(phoneController.text, passwordTextController.text).then((userCredential) {
          _appPreferences.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
        });
      } on Exception catch (e) {
        Navigator.of(context).pop();
        showError(context, e.toString(), () {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Form(
            key: formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Phone Number Edit Text
                TextFormField(
                  controller: phoneController,
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
                  controller: passwordTextController,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.passwordInvalid;
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
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.registerRoute);
                      },
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
    );
  }
}
