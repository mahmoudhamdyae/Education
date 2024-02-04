import 'package:education/data/remote/remote_data_source.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/domain/models/notes/note.dart';
import 'package:education/domain/repository/repository.dart';

import '../../domain/models/courses/class_model.dart';
import '../../domain/models/lesson/lesson.dart';
import '../../domain/models/returned_video.dart';
import '../local/local_data_source.dart';

class RepositoryImpl extends Repository {

  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(this._remoteDataSource, this._localDataSource);

  // Local Data Source

  @override
  Future<bool> isFirstTime() {
    return _localDataSource.isFirstTime();
  }

  @override
  bool isUserLoggedIn() {
    return _localDataSource.isUserLoggedIn();
  }

  @override
  String getUserName() {
    return _localDataSource.getUserName();
  }

  @override
  String getGrade() {
    return _localDataSource.getGrade();
  }

  @override
  String getPhoneNumber() {
    return _localDataSource.getPhoneNumber();
  }

  @override
  Future<void> setFav(Course course) {
    return _localDataSource.setFav(course);
  }

  @override
  Future<List<Course>> getFav() {
    return _localDataSource.getFav();
  }

  @override
  Future<void> removeFav(int courseId) {
    return _localDataSource.removeFav(courseId);
  }

  @override
  Future<void> saveVideo(Course course, Lesson lesson) {
    return _localDataSource.saveVideo(course, lesson);
  }

  @override
  Future<List<ReturnedVideo>> getVideos() {
    return _localDataSource.getVideos();
  }

  @override
  Future<void> removeVideo(int courseId, int lessonId) {
    return _localDataSource.removeVideo(courseId, lessonId);
  }

  // Notes Cart

  @override
  Future<void> addNoteToCart(String noteId) {
    return _localDataSource.addNoteToCart(noteId);
  }

  @override
  List<String> getAllNotesCart() {
    return _localDataSource.getAllNotesCart();
  }

  @override
  bool isNoteInCart(String noteId) {
    return _localDataSource.isNoteInCart(noteId);
  }

  @override
  Future<List<Note>> getAllNotes() {
    return _remoteDataSource.getAllNotes(_localDataSource.getAllNotesCart());
  }

  @override
  Future<void> removeNoteFromCart(String noteId) {
    return _localDataSource.removeNoteFromCart(noteId);
  }

  // Account Service

  @override
  Future<void> logIn(String phone, String password) {
    return _remoteDataSource.logIn(phone, password).then((data) {
      _localDataSource.setUserId(data['user']['id']);
      _localDataSource.setUserName(data['user']['name']);
      _localDataSource.setGrade(data['user']['group']);
      _localDataSource.setPhoneNumber(data['user']['phone']);
      _localDataSource.setUserLoggedIn();
    });
  }

  @override
  Future<void> register(String userName, String phone, String password, String grade, String group) {
    return _remoteDataSource.register(userName, phone, password, grade, group);
  }

  @override
  Future<void> signOut() async {
    return await _localDataSource.signOut();
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

  @override
  Future<List<Note>> getNotes(String marhala) async {
    return await _remoteDataSource.getNotes(marhala);
  }

  @override
  Future<void> order(String userName, String phone, String city, String address) async {
    _remoteDataSource.order(userName, phone, city, address, _localDataSource.getUserId()).then((value) {
      _localDataSource.removeAllNotesFromCart();
    });
  }
}