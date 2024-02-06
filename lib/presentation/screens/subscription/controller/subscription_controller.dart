import 'package:education/domain/models/subscription_response.dart';
import 'package:get/get.dart';

import '../../../../domain/repository/repository.dart';

class SubscriptionController extends GetxController {

  final RxList<UserCourses> courses = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  SubscriptionController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getSubscription();
  }

  _getSubscription() async {
    _status.value = RxStatus.loading();
    try {
      await _repository.getSubscriptions().then((remoteCourses) {
        _status.value = RxStatus.success();
        courses.value = remoteCourses;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      courses.value = [];
    }
  }
}