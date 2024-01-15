import 'package:education/domain/models/courses/class_model.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class RecordedCoursesController extends GetxController {

  final Rx<ClassModel> classModel = ClassModel([], []).obs;

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  RecordedCoursesController(this._repository);

  getRecordedCourses() async {
    classModel.value = ClassModel([], []);
    String saff = _repository.getGrade();
    try {
      if (
          saff == AppStrings.saff1 ||
          saff == AppStrings.saff2 ||
          saff == AppStrings.saff3 ||
          saff == AppStrings.saff4 ||
          saff == AppStrings.saff5 ||
          saff == ''
      ) {
        _status.value = RxStatus.success();
        classModel.value = ClassModel([], []);
      } else {
        await _repository.getRecordedCourses(saff).then((remoteClassModel) {
          _status.value = RxStatus.success();
          classModel.value = remoteClassModel;
        });
      }
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      classModel.value = ClassModel([], []);
    }
  }
}