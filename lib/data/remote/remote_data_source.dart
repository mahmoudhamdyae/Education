import 'package:education/domain/models/courses/course.dart';

class RemoteDataSource {

  Future<List<Course>> getSubscriptions() {
    return Future(() => []);
  }
}