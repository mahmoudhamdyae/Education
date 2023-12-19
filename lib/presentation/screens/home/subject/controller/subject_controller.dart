import 'package:education/domain/models/lesson/wehda.dart';
import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class SubjectController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<Wehda> wehdat = RxList.empty();

  final Repository _repository;

  SubjectController(this._repository);

  getTutorials(int courseId) async {
    try {
      isLoading.value = true;
      error.value = '';
      wehdat.value = [];
      await _repository.getTutorials(courseId).then((tutorials) {
        isLoading.value = false;
        error.value = '';
        wehdat.value = tutorials;
      });
    } on Exception catch (e) {
      error.value = e.toString();
      isLoading.value = false;
      wehdat.value = [];
    }
  }
}