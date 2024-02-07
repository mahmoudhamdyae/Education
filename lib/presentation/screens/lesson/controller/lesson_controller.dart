import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/domain/models/subscription_response.dart';
import 'package:education/presentation/screens/subscription/controller/subscription_controller.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../../domain/models/lesson/wehda.dart';
import '../../../../domain/repository/repository.dart';

class LessonController extends GetxController {
  final RxList<Wehda> wehdat = RxList.empty();
  final Rx<Lesson> selectedLesson = Lesson(0, '', '', '', '', -1).obs;
  late final int courseId;
  late bool _isSubscribed = false;

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  LessonController(this._repository);

  @override
  void onInit() {
    super.onInit();
    courseId = (Get.arguments['course'] as Course).id;
    _getTutorials();
  }

  bool isSubscribed() {
    List<UserCourses> subscribedCourses = Get.find<SubscriptionController>().courses;
    for (var element in subscribedCourses) {
      if (element.id == courseId) {
        _isSubscribed = true;
      }
    }
    return _isSubscribed;
  }

  _getTutorials() async {
    try {
      _status.value = RxStatus.loading();
      wehdat.value = [];
      await _repository.getTutorials(courseId).then((tutorials) {
        _status.value = RxStatus.success();
        wehdat.value = tutorials;
        // if (tutorials.isNotEmpty) selectedLesson.value = wehdat[0].lessons[0];
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      wehdat.value = [];
    }
  }
}