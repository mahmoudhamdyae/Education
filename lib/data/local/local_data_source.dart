import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/domain/models/returned_video.dart';
import 'package:get/get.dart';
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
  Future<void> setPhoneNumber(String number);
  String getPhoneNumber();
  Future<void> setFav(Course course);
  Future<List<Course>> getFav();
  Future<void> removeFav(int courseId);
  Future<void> saveVideo(Course course, Lesson lesson);
  Future<List<ReturnedVideo>> getVideos();
  Future<void> removeVideo(int courseId, int lessonId);
}

const String keyIsUserLoggedIn = "KEY_IS_USER_LOGGED_IN";
const String keyUserId = "KEY_USER_ID";
const String keyUserName = "KEY_USER_NAME";
const String keyGrade = "KEY_GRADE";
const String keyPhoneNumber = "KEY_PHONE_NUMBER";

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
    setPhoneNumber('');
    setGrade('');
    setUserName('');
    _delSaved();
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
  Future<void> setPhoneNumber(String number) async {
    return await _box.put(keyPhoneNumber, number);
  }

  @override
  String getPhoneNumber() {
    return _box.get(keyPhoneNumber, defaultValue: '');
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
    favBox.delete(desiredKey);
  }

  @override
  Future<void> saveVideo(Course course, Lesson lesson) async {
    var videosBox = await Hive.openBox<Course>('videos');

    final Map<dynamic, Course> courseMap = videosBox.toMap();
    dynamic desiredKey;
    courseMap.forEach((key, value){
      if (value.id == course.id) {
        desiredKey = key;
      }
    });
    if (desiredKey == null) {
      // Add
      await videosBox.add(course);
      _saveLesson(course.id, lesson);
    } else {
      // Update
    }
  }

  Future<void> _saveLesson(int courseId, Lesson lesson) async {
    var lessonBox = await Hive.openBox<Lesson>('lesson');
    lessonBox.put('$courseId-${lesson.id}', lesson);
  }

  @override
  Future<List<ReturnedVideo>> getVideos() async {
    List<ReturnedVideo> returnedVideos = [];

    var videosBox = await Hive.openBox<Course>('videos');
    List<Course> courses =  videosBox.values.toList();
    var lessonBox = await Hive.openBox<Lesson>('lesson');
    List<Lesson> lessons =  lessonBox.values.toList();
    for (var singleLesson in lessons) {
      Course? course = courses.firstWhereOrNull((element) => element.id == singleLesson.tutorialId);
      if (course != null) returnedVideos.add(ReturnedVideo(course, singleLesson));
    }
    return returnedVideos;
  }

  @override
  Future<void> removeVideo(int courseId, int lessonId) async {
    var videosBox = await Hive.openBox<Course>('videos');
    final Map<dynamic, Course> courseMap = videosBox.toMap();
    // dynamic desiredKey;
    courseMap.forEach((key, value) async {
      if (value.id == courseId) {
        // desiredKey = key;
        var lessonBox = await Hive.openBox<Lesson>('lesson');
        lessonBox.delete('$courseId-$lessonId');
      }
    });
    // videosBox.delete(desiredKey);
  }
  
  void _delSaved() async {
    var favBox = await Hive.openBox<Course>('course');
    var videosBox = await Hive.openBox<Course>('videos');
    var lessonBox = await Hive.openBox<Course>('lesson');
    favBox.deleteFromDisk();
    videosBox.deleteFromDisk();
    lessonBox.deleteFromDisk();
  }
}