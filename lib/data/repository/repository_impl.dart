import 'package:education/data/remote/remote_data_source.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/domain/repository/repository.dart';

import '../../domain/models/courses/class_model.dart';

class RepositoryImpl extends Repository {

  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<ClassModel> getRecordedCourses(String marhala) async {
    return _remoteDataSource.getRecordedCourses(marhala);
  }

  @override
  Future<List<Wehda>> getTutorials(int courseId) {
    return _remoteDataSource.getTutorials(courseId);
  }

  @override
  Future<List<Course>> getSubscriptions() async {
    return _remoteDataSource.getSubscriptions();
  }

  @override
  Future<String> downloadNote(String link) {
    return _remoteDataSource.downloadNote(link);
  }

  @override
  Future<String> askQuestion(String question) {
    return _remoteDataSource.askQuestion(question);
  }
}