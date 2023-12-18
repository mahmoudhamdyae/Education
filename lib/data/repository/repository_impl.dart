import 'package:education/data/remote/remote_data_source.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/repository/repository.dart';

class RepositoryImpl extends Repository {

  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Course>> getSubscriptions() async {
    return _remoteDataSource.getSubscriptions();
  }
}