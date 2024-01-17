import 'package:education/domain/models/returned_video.dart';
import 'package:education/domain/repository/repository.dart';
import 'package:flutter/cupertino.dart';
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
        debugPrint('--------- get -- ${courses.length}');
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
        debugPrint('--------- save courses ${course.id} ${course.name}');
        debugPrint('--------- save lessons ${lesson.id} ${lesson.title}');
        debugPrint('--------- save -- ${courses.length}');
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  void removeVideo(Course course, Lesson lesson) {
    try {
      _repository.removeVideo(course.id, lesson.id).then((value) {
        _status.value = RxStatus.success();
        _getVideos();
        debugPrint('--------- remove courses ${course.id} ${course.name}');
        debugPrint('--------- remove lessons ${lesson.id} ${lesson.title}');
        debugPrint('--------- remove -- ${courses.length}');
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
    }
  }

  bool isSaved(Course course, Lesson lesson) {
    return courses.any((element) => element.course.id == course.id && element.lesson.id == lesson.id);
  }
}