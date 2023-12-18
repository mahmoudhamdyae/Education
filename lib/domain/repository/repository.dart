import 'package:education/domain/models/courses/course.dart';

import '../models/courses/class_model.dart';

abstract class Repository {

  Future<ClassModel> getRecordedCourses(String marhala);
  Future<List<Course>> getSubscriptions();
}