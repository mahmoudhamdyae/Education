import 'package:education/data/remote/remote_data_source.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/domain/repository/repository.dart';

import '../../domain/models/courses/class_model.dart';
import '../local/local_data_source.dart';

class RepositoryImpl extends Repository {

  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(this._remoteDataSource, this._localDataSource);

  // Local Data Source

  @override
  Future<bool> isUserLoggedIn() {
    return _localDataSource.isUserLoggedIn();
  }

  @override
  Future<void> logout() {
    return _localDataSource.logout();
  }

  // Account Service

  @override
  Future<void> logIn(String phone, String password) {
    return _remoteDataSource.logIn(phone, password).then((userId) {
      _localDataSource.setUserId(userId);
      _localDataSource.setUserLoggedIn();
    });
  }

  @override
  Future<void> register(String userName, String phone, String password, String grade, String group) {
    return _remoteDataSource.register(userName, phone, password, grade, group);
  }

  @override
  Future<void> signOut() async {
    return _localDataSource.logout();
  }

  // Remote Data Source

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
  Future<String> askQuestion(String question) {
    return _remoteDataSource.askQuestion(question);
  }
}