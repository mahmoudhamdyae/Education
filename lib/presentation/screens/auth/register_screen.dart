import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_prefs.dart';
import '../../../core/di.dart';
import '../../../data/remote/account_service.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/loading_dialog.dart';
import '../main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterScreen> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final AccountService _accountService = instance<AccountService>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool _obscureText = true;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<String> _marahel = [
    AppStrings.primaryMarhala,
    AppStrings.mediumMarhala,
    AppStrings.secondaryMarhala,
    AppStrings.qodoratMarhala,
    AppStrings.toeflMarhala,
    AppStrings.ieltsMarhala,
  ];
  String _selectedMarhala = AppStrings.marhalaHint;

  List<String> _sfoof = [
    AppStrings.saff1
  ];
  String _selectedSaff = AppStrings.saff;

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

      if (_selectedMarhala == AppStrings.marhalaHint) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.marhalaInvalid)));
        return;
      }

      if (_selectedSaff == AppStrings.saff) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(AppStrings.saffInvalid)));
        return;
      }

      try {
        showLoading(context);
        await _accountService.register(_nameController.text, _numberController.text, _passController.text, _selectedMarhala, _selectedSaff)
            .then((userCredential) {
          _accountService.logIn(_numberController.text, _passController.text).then((value) {
            _appPreferences.setUserLoggedIn();
            Get.offAll(MainScreen());
          });
        });
      } on Exception catch (e) {
        Get.back();
        if (context.mounted) showError(context, e.toString(), () {});
      }
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
        child: Form(
            key: formState,
            child: ListView(
              children: [
                // User Name Edit Text
                TextFormField(
                  controller: _nameController,
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
                  controller: _numberController,
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
                  value: _marahel.first,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedMarhala = newValue!;
                      switch(_selectedMarhala) {
                        case AppStrings.primaryMarhala:
                          _sfoof = [
                            AppStrings.saff1,
                            AppStrings.saff2,
                            AppStrings.saff3,
                            AppStrings.saff4,
                            AppStrings.saff5,
                          ];
                          break;
                        case AppStrings.mediumMarhala:
                          _sfoof = [
                            AppStrings.saff6,
                            AppStrings.saff7,
                            AppStrings.saff8,
                            AppStrings.saff9,
                          ];
                          break;
                        case AppStrings.secondaryMarhala:
                          _sfoof = [
                            AppStrings.saff10,
                            AppStrings.saff11,
                            AppStrings.saff12,
                          ];
                          break;
                        case AppStrings.qodoratMarhala:
                          _sfoof = [
                            AppStrings.qodoratMarhala,
                          ];
                          break;
                        case AppStrings.toeflMarhala:
                          _sfoof = [
                            AppStrings.toeflMarhala,
                          ];
                          break;
                        case AppStrings.ieltsMarhala:
                          _sfoof = [
                            AppStrings.ieltsMarhala,
                          ];
                          break;
                      }
                      _selectedSaff = _sfoof.first;
                    });
                  },
                  items: _marahel.map((marhala) {
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
                  hint: Text(_selectedSaff),
                  value: _sfoof.first,
                  onChanged: (
                      _selectedSaff == AppStrings.qodoratMarhala ||
                          _selectedSaff == AppStrings.toeflMarhala ||
                          _selectedSaff == AppStrings.ieltsMarhala
                  ) ? null : (newValue) {
                    setState(() {
                      _selectedSaff = newValue.toString();
                    });
                  },
                  items: _sfoof.map((saff) {
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
                  controller: _passController,
                  textInputAction: TextInputAction.next,
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
                // Repeat Password Edit Text
                TextFormField(
                  controller: _confirmPassController,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val != _passController.text) {
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
            )),
      ),
    );
  }
}