import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:get/get.dart';

import '../../../../../domain/repository/repository.dart';

class SubjectController2 extends GetxController {

  final RxList<Wehda> wehdat = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  SubjectController2(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getTutorials();
  }

  _getTutorials() async {
    try {
      _status.value = RxStatus.loading();
      wehdat.value = [];
      await _repository.getTutorials((Get.arguments['course'] as Course).id).then((tutorials) {
        _status.value = RxStatus.success();
        wehdat.value = tutorials;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      wehdat.value = [];
    }
  }
}