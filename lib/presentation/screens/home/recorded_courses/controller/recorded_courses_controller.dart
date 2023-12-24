import 'package:education/domain/models/courses/class_model.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class RecordedCoursesController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<ClassModel> classModel = ClassModel([], []).obs;

  final Repository _repository;
  final String _saff;

  RecordedCoursesController(this._repository, this._saff);


  @override
  void onInit() {
    super.onInit();
    getRecordedCourses();
  }

  getRecordedCourses() async {
    classModel.value = ClassModel([], []);
    isLoading.value = true;
    try {
      if (
          _saff == AppStrings.saff1 ||
          _saff == AppStrings.saff2 ||
          _saff == AppStrings.saff3 ||
          _saff == AppStrings.saff4 ||
          _saff == AppStrings.saff5
      ) {
        isLoading.value = false;
        error.value = '';
        classModel.value = ClassModel([], []);
      } else {
        await _repository.getRecordedCourses(_saff).then((remoteClassModel) {
          isLoading.value = false;
          error.value = '';
          classModel.value = remoteClassModel;
        });
      }
    } on Exception catch (e) {
      error.value = e.toString();
      isLoading.value = false;
      classModel.value = ClassModel([], []);
    }
  }
}