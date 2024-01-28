import 'package:education/domain/models/courses/class_model.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/lesson.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/domain/models/notes/note.dart';
import 'package:education/domain/models/returned_video.dart';
import 'package:education/domain/repository/repository.dart';

class FakeRepository extends Repository {

  final ClassModel classModel =
    ClassModel(
        [Course(0, 'name', 1, 1, 'المرحلة الابتدائية', 'الصف السادس', '5.0', 'teacher')],
        []
    );

  @override
  Future<String> askQuestion(String question) {
    // TODO: implement askQuestion
    throw UnimplementedError();
  }

  @override
  Future<List<Course>> getFav() {
    // TODO: implement getFav
    throw UnimplementedError();
  }

  @override
  String getGrade() {
    // TODO: implement getGrade
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes(String marhala) {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  String getPhoneNumber() {
    // TODO: implement getPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<ClassModel> getRecordedCourses(String marhala) async {
    return classModel;
  }

  @override
  Future<List<Course>> getSubscriptions() {
    // TODO: implement getSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<List<Wehda>> getTutorials(int courseId) {
    // TODO: implement getTutorials
    throw UnimplementedError();
  }

  @override
  String getUserName() {
    // TODO: implement getUserName
    throw UnimplementedError();
  }

  @override
  Future<List<ReturnedVideo>> getVideos() {
    // TODO: implement getVideos
    throw UnimplementedError();
  }

  @override
  Future<bool> isFirstTime() {
    // TODO: implement isFirstTime
    throw UnimplementedError();
  }

  @override
  bool isUserLoggedIn() {
    // TODO: implement isUserLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> logIn(String phone, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> register(String userName, String phone, String password, String grade, String group) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> removeFav(int courseId) {
    // TODO: implement removeFav
    throw UnimplementedError();
  }

  @override
  Future<void> removeVideo(int courseId, int lessonId) {
    // TODO: implement removeVideo
    throw UnimplementedError();
  }

  @override
  Future<void> saveVideo(Course course, Lesson lesson) {
    // TODO: implement saveVideo
    throw UnimplementedError();
  }

  @override
  Future<void> setFav(Course course) {
    // TODO: implement setFav
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}