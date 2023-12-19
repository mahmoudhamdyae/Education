import 'package:education/domain/models/courses/class_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class RecordedCoursesController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final Rx<ClassModel> classModel = ClassModel([], []).obs;

  final Repository _repository;

  RecordedCoursesController(this._repository);

  // @override
  // void onInit() {
  //   super.onInit();
  //   _getRecordedCourses();
  // }

  getRecordedCourses(String marhala) async {
    classModel.value = ClassModel([], []);
    isLoading.value = true;
    debugPrint('=========================class model1 ${classModel.value}');
    try {
      await _repository.getRecordedCourses(marhala).then((remoteClassModel) {
        isLoading.value = false;
        error.value = '';
        remoteClassModel.courses.forEach((element) {
          debugPrint('=========================${element.name}');
        });
        classModel.value = remoteClassModel;
        debugPrint('=========================class model ${classModel.value}');
      });
    } on Exception catch (e) {
      error.value = e.toString();
      isLoading.value = false;
      classModel.value = ClassModel([], []);
    }
  }
}