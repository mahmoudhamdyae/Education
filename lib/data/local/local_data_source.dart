import 'package:hive/hive.dart';

import '../../domain/models/courses/course.dart';

abstract class LocalDataSource {
  Future<void> setUserLoggedIn();
  bool isUserLoggedIn();
  Future<void> signOut();
  Future<void> setUserId(int id);
  int getUserId();
  Future<void> setUserName(String name);
  String getUserName();
  Future<void> setGrade(String grade);
  String getGrade();
  Future<int> setFav(Course course);
  List<Course> getFav();
}

const String keyIsUserLoggedIn = "KEY_IS_USER_LOGGED_IN";
const String keyUserId = "KEY_USER_ID";
const String keyUserName = "KEY_USER_NAME";
const String keyGrade = "KEY_Grade";

class LocalDataSourceImpl extends LocalDataSource {

  final Box _box;
  final Box<Course> _favBox;
  LocalDataSourceImpl(this._box, this._favBox);

  @override
  Future<void> setUserLoggedIn() async {
    return await _box.put(keyIsUserLoggedIn, true);
  }

  @override
  bool isUserLoggedIn() {
    return _box.get(keyIsUserLoggedIn, defaultValue: false);
  }

  @override
  Future<void> signOut() async {
    await _box.put(keyIsUserLoggedIn, false);
    setUserId(0);
  }

  @override
  Future<void> setUserId(int id) async {
    return await _box.put(keyUserId, id);
  }

  @override
  int getUserId() {
    return _box.get(keyUserId, defaultValue: 0);
  }

  @override
  Future<void> setUserName(String name) async {
    return await _box.put(keyUserName, name);
  }

  @override
  String getUserName() {
    return _box.get(keyUserName, defaultValue: '');
  }

  @override
  Future<void> setGrade(String grade) async {
    return await _box.put(keyGrade, grade);
  }

  @override
  String getGrade() {
    return _box.get(keyGrade, defaultValue: '');
  }

  @override
  Future<int> setFav(Course course) async {
    return await _box.add(course);
  }

  @override
  List<Course> getFav() {
    return _favBox.values.toList();
  }
}