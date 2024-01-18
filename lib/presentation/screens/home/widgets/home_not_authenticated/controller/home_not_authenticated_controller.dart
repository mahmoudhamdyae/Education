import 'package:get/get.dart';

import '../../../../../../domain/models/courses/course.dart';
import '../../../../../../domain/repository/repository.dart';
import '../../../../../resources/strings_manager.dart';

class HomeNotAuthenticatedController extends GetxController {

  final RxString saff = RxString('');
  final RxList<Course> courses = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  HomeNotAuthenticatedController(this._repository);

  getRecordedCourses() async {
    _status.value = RxStatus.loading();
    try {
      if (
      saff.value == AppStrings.saff1 ||
          saff.value == AppStrings.saff2 ||
          saff.value == AppStrings.saff3 ||
          saff.value == AppStrings.saff4 ||
          saff.value == AppStrings.saff5 ||
          saff.value == ''
      ) {
        _status.value = RxStatus.success();
        courses.value = [];
      } else {
        await _repository.getRecordedCourses(saff.value).then((remoteClassModel) {
          _status.value = RxStatus.success();
          courses.value = remoteClassModel.courses;
        });
      }
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      courses.value = [];
    }
  }
}