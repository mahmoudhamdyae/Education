import 'package:flutter/cupertino.dart';
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
  Future<void> setFav(Course course);
  Future<List<Course>> getFav();
  Future<void> removeFav(int courseId);
}

const String keyIsUserLoggedIn = "KEY_IS_USER_LOGGED_IN";
const String keyUserId = "KEY_USER_ID";
const String keyUserName = "KEY_USER_NAME";
const String keyGrade = "KEY_Grade";

class LocalDataSourceImpl extends LocalDataSource {

  final Box _box;
  LocalDataSourceImpl(this._box);

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
  Future<void> setFav(Course course) async {
    var favBox = await Hive.openBox<Course>('course');

    final Map<dynamic, Course> courseMap = favBox.toMap();
    dynamic desiredKey;
    courseMap.forEach((key, value){
      if (value.id == course.id) {
        desiredKey = key;
      }
    });
    if (desiredKey == null) {
      // Add
      await favBox.add(course);
    } else {
      // Update
    }
  }

  @override
  Future<List<Course>> getFav() async {
    var favBox = await Hive.openBox<Course>('course');
    return favBox.values.toList();
  }

  @override
  Future<void> removeFav(int courseId) async {
    var favBox = await Hive.openBox<Course>('course');
    final Map<dynamic, Course> courseMap = favBox.toMap();
    dynamic desiredKey;
    courseMap.forEach((key, value){
      if (value.id == courseId) {
        desiredKey = key;
      }
    });
    favBox.delete(desiredKey).then((value) => debugPrint('***************** ${desiredKey.toString()}'));
  }
}