import 'package:education/domain/models/returned_video.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:get/get.dart';

import '../../../../domain/models/courses/course.dart';
import '../../../../domain/models/lesson/lesson.dart';

class VideoController extends GetxController {

  final RxList<ReturnedVideo> courses = RxList.empty();

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;

  final Repository _repository;

  VideoController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _getVideos();
  }

  _getVideos() async {
    _status.value = RxStatus.loading();
    try {
      _repository.getVideos().then((localCourses) {
        _status.value = RxStatus.success();
        courses.value = localCourses;
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      courses.value = [];
    }
  }

  void saveVideo(Course course, Lesson lesson) {
    try {
      _repository.saveVideo(course, lesson).then((value) {
        _status.value = RxStatus.success();
        courses.add(ReturnedVideo(course, lesson));
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  void removeVideo(Course course, Lesson lesson) {
    try {
      _repository.removeVideo(course.id, lesson.id).then((value) {
        _status.value = RxStatus.success();
        courses.remove(ReturnedVideo(course, lesson));
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  bool isSaved(Lesson lesson) {
    bool x = courses.any((element) => element.lesson.id == lesson.id);
    return x;
  }
}