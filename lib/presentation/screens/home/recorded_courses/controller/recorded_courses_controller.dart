import 'package:education/domain/models/courses/class_model.dart';
import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class RecordedCoursesController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<ClassModel> classModel = ClassModel([], []).obs;

  final Repository _repository;

  RecordedCoursesController(this._repository);

  getRecordedCourses(String marhala) async {
    try {
      await _repository.getRecordedCourses(marhala).then((remoteClassModel) {
        isLoading.value = false;
        error.value = '';
        classModel.value = remoteClassModel;
      });
    } on Exception catch (e) {
      error.value = e.toString();
      isLoading.value = false;
      classModel.value = ClassModel([], []);
    }
  }
}