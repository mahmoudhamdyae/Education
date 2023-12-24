import 'package:education/domain/models/courses/class_model.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class RecordedCoursesController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<ClassModel> classModel = ClassModel([], []).obs;

  final Repository _repository;

  RecordedCoursesController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getRecordedCourses();
  }

  _getRecordedCourses() async {
    classModel.value = ClassModel([], []);
    isLoading.value = true;
    Map<String, dynamic> args = Get.arguments;
    String saff = args['saff'];
    try {
      if (
          saff == AppStrings.saff1 ||
          saff == AppStrings.saff2 ||
          saff == AppStrings.saff3 ||
          saff == AppStrings.saff4 ||
          saff == AppStrings.saff5
      ) {
        isLoading.value = false;
        error.value = '';
        classModel.value = ClassModel([], []);
      } else {
        await _repository.getRecordedCourses(saff).then((remoteClassModel) {
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