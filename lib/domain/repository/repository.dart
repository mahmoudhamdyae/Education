import 'package:education/domain/models/courses/course.dart';

abstract class Repository {

  Future<List<Course>> getSubscriptions();
}