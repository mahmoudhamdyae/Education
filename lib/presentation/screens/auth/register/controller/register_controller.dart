import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class RegisterController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxString userName = ''.obs;
  final RxString phone = ''.obs;
  final RxString password = ''.obs;
  final RxString grade = ''.obs;
  final RxString group = ''.obs;
  final RxBool obscureText = true.obs;

  final Repository _repository;

  RegisterController(this._repository);

  void toggleSecurePassword() {
    obscureText.value = !obscureText.value;
  }

  void register() {
    isLoading.value = true;
    error.value = '';
    try {
      _repository.register(
          userName.value,
          phone.value,
          password.value,
          grade.value,
          group.value
      ).then((remoteCourses) {
        isLoading.value = false;
        error.value = '';
      });
    } on Exception catch (e) {
      error.value = e.toString();
      isLoading.value = false;
    }
  }
}