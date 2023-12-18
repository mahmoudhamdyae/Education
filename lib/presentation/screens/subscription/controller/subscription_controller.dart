import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../../domain/repository/repository.dart';

class SubscriptionController extends GetxController {

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;
  final RxList<Course> courses = RxList.empty();

  final Repository _repository;

  SubscriptionController(this._repository);


  @override
  void onInit() {
    super.onInit();
    _getSubscription();
  }

  _getSubscription() async {
    try {
      await _repository.getSubscriptions().then((remoteCourses) {
        isLoading.value = false;
        error.value = '';
        courses.value = remoteCourses;
      });
    } on Exception catch (e) {
      error.value = e.toString();
      isLoading.value = false;
      courses.value = [];
    }
  }
}