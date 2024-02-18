import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/domain/models/subscription_response.dart';
import 'package:education/presentation/screens/subscription/controller/subscription_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../domain/models/comment.dart';
import '../../../../domain/models/courses/course.dart';
import '../../../../domain/models/lesson/wehda.dart';
import '../../../../domain/repository/repository.dart';

class LessonController extends GetxController {
  final RxList<Wehda> wehdat = RxList.empty();
  final RxList<Comment> comments = RxList.empty();
  late final int courseId;
  late bool _isSubscribed = false;
  final TextEditingController commentEditText = TextEditingController();

  final Rx<Lesson> _selectedLesson = Lesson(0, '', '', '', '', -1).obs;
  set selectedLesson(Rx<Lesson> value) {
    _selectedLesson.value = value.value;
  }
  Rx<Lesson> get selectedLesson {
    return _selectedLesson;
  }

  final Rx<RxStatus> _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;
  final Rx<RxStatus> _addCommentStatus = Rx<RxStatus>(RxStatus.empty());
  RxStatus get addCommentStatus => _addCommentStatus.value;

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
        _selectedLesson.value =tutorials[0].lessons[0];



















        comments.value = [];
      });
    } on Exception catch (e) {
      _status.value = RxStatus.error(e.toString());
      wehdat.value = [];
    }
  }

  Future<void> addComment() async {
    try {
      _addCommentStatus.value = RxStatus.loading();
      await _repository.addComment(commentEditText.text, _selectedLesson.value.id).then((value) {
        _addCommentStatus.value = RxStatus.success();
        comments.add(Comment(comment: commentEditText.text));
        commentEditText.text = '';
      });
    } on Exception catch (e) {
      _addCommentStatus.value = RxStatus.error(e.toString());
    }
  }

  void updateComment(String comment) {
    commentEditText.text = comment;
  }

  @override
  void onClose() {
    super.onClose();
    commentEditText.dispose();
  }
}