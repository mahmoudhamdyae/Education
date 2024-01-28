import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';

import '../models/courses/class_model.dart';
import '../models/lesson/lesson.dart';
import '../models/notes/note.dart';
import '../models/returned_video.dart';

abstract class Repository {

  // Local Data Source
  Future<bool> isFirstTime();
  bool isUserLoggedIn();
  String getUserName();
  String getGrade();
  String getPhoneNumber();
  Future<void> setFav(Course course);
  Future<List<Course>> getFav();
  Future<void> removeFav(int courseId);
  Future<void> saveVideo(Course course, Lesson lesson);
  Future<List<ReturnedVideo>> getVideos();
  Future<void> removeVideo(int courseId, int lessonId);

  // Notes Cart
  Future<void> addNoteToCart(String noteId);
  Future<void> removeNoteFromCart(String noteId);
  List<String> getAllNotesCart();
  bool isNoteInCart(String noteId);
  Future<void> removeAllNotesFromCart();

  // Account Service
  Future<void> register(String userName, String phone, String password, String grade, String group);
  Future<void> logIn(String phone, String password);
  Future<void> signOut();

  // Remote Data Source
  Future<ClassModel> getRecordedCourses(String marhala);
  Future<List<Wehda>> getTutorials(int courseId);
  Future<List<Course>> getSubscriptions();
  Future<String> askQuestion(String question);
  Future<List<Note>> getNotes(String marhala);
}