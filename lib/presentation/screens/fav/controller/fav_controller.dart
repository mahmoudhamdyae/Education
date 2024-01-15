import 'package:education/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';

class FavController extends GetxController {

  final RxList<Course> courses = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  FavController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getFav();
  }

  _getFav() async {
    _status.value = RxStatus.loading();
    try {
      courses.value = _repository.getFav();
      _status.value = RxStatus.success();
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      courses.value = [];
    }
  }

  void setFav(Course course) {
    try {
      _repository.setFav(course).then((value) {
        _status.value = RxStatus.success();
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  bool isFav(Course course) {
    return courses.contains(course);
  }
}