import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';

class LessonController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  final Repository _repository;

  LessonController(this._repository);

  askQuestion(String question) async {
    try {
      isLoading.value = true;
      error.value = '';
      // wehdat.value = [];
      // await _repository.askQuestion(question).then((value) {
      //   isLoading.value = false;
      //   error.value = '';
      //   wehdat.value = tutorials;
      // });
    } on Exception catch (e) {
      error.value = e.toString();
      isLoading.value = false;
      // wehdat.value = [];
    }
  }
}