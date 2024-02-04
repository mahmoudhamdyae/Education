import 'package:dio/dio.dart';
import 'package:education/core/converters.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/domain/models/notes/note.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../core/constants.dart';
import '../../domain/models/courses/baqa.dart';
import '../../domain/models/courses/class_model.dart';

import '../../domain/models/teacher.dart';
import '../network_info.dart';

abstract class RemoteDataSource {
  Future register(String userName, String phone, String password, String grade, String group);
  Future<dynamic> logIn(String phone, String password);

  Future<ClassModel> getRecordedCourses(String marhala);
  Future<List<Wehda>> getTutorials(int courseId);
  Future<List<Course>> getSubscriptions();
  Future<String> askQuestion(String question);
  Future<List<Note>> getNotes(String marhala);
  Future<List<Note>> getAllNotes(List<String> notesId);
  Future<void> order(String userName, String phone, String city, String address, int userId);
  Future<List<Teacher>> getTeachers();
}

class RemoteDataSourceImpl extends RemoteDataSource {

  final NetworkInfo _networkInfo;
  final Dio _dio;
  RemoteDataSourceImpl(this._networkInfo, this._dio);

  @override
  Future register(String userName, String phone, String password, String grade, String group) async {
    await _checkNetwork();
    String url = "${Constants.baseUrl}auth/register";
    Response response = await _dio.post(url, data: {
      'name': userName,
      'password': password,
      'phone': phone,
      'grade': grade,
      'group': group,
    });

    if (response.data["message"] == null) {
      throw Exception(AppStrings.previouslyUser);
    }
  }

  @override
  Future<dynamic> logIn(String phone, String password) async {
    await _checkNetwork();
    String url = "${Constants.baseUrl}auth/login?&password=$password&phone=$phone";
    final response = await _dio.post(url, data: {
      'password': password,
      'phone': phone,
    });

    final data = response.data;
    if (data["access_token"] == null) {
      throw Exception(AppStrings.wrongPhoneOrPassword);
    }
    return data;
  }

  @override
  Future<ClassModel> getRecordedCourses(String marhala) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}courses";
    final response = await _dio.get(url);

    List<Course> courses = [];
    String s = convertSaff(marhala, 'course');
    for (var singleCourse in response.data[s]) {
      Course course = Course.fromJson(singleCourse);
      debugPrint('Get Recorded Courses Response: $marhala');
      courses.add(course);
    }

    return ClassModel(
        courses,
        [
          Baqa(8, 7, 60),
          Baqa(7, 0, 38),
        ]
    );
  }

  @override
  Future<List<Wehda>> getTutorials(int courseId) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}tutorial/$courseId";
    final response = await _dio.get(url);

    List<Wehda> wehdat = [];
    for (var singleCourse in response.data['tutorial']) {
      Wehda wehda = Wehda.fromJson(singleCourse);
      wehdat.add(wehda);
    }

    return wehdat;
  }

  @override
  Future<List<Course>> getSubscriptions() async {
    await _checkNetwork();
    return Future(() => []);
  }

  @override
  Future<String> askQuestion(String question) async {
    await _checkNetwork();
    Future.delayed(const Duration(seconds: 4));
    return Future(() => '');
  }

  _checkNetwork() async {
    if (!await _networkInfo.isConnected) {
      throw Exception(AppStrings.noInternetError);
    }
  }

  @override
  Future<List<Note>> getNotes(String marhala) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}books";
    final response = await _dio.get(url);

    List<Note> notes = [];
    String s = convertSaff(marhala, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      notes.add(note);
    }

    return notes;
  }

  @override
  Future<List<Note>> getAllNotes(List<String> notesId) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}books";
    final response = await _dio.get(url);

    List<Note> notes = [];
    String s = convertSaff(AppStrings.saff6, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff7, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff8, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff9, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff10, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff11, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff12, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }

    return notes;
  }

  @override
  Future<void> order(String userName, String phone, String city, String address, int userId) async {
    await _checkNetwork();

    // String url = "${Constants.baseUrl}";
    // await _dio.post(url);
  }

  @override
  Future<List<Teacher>> getTeachers() async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}teacher/index";
    var response = await _dio.get(url);
    List<Teacher> teachers = TeacherResponse.fromJson(response.data).teacher ?? [];
    return teachers;
  }
}