import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:education/core/converters.dart';
import 'package:education/domain/models/city.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/domain/models/notes/note.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:pair/pair.dart';

import '../../core/constants.dart';
import '../../domain/models/comment.dart';
import '../../domain/models/courses/class_model.dart';

import '../../domain/models/package.dart';
import '../../domain/models/subscription_response.dart';
import '../../domain/models/teacher.dart';
import '../network_info.dart';

abstract class RemoteDataSource {
  Future register(String userName, String phone, String password, String grade, String group);
  Future<dynamic> logIn(String phone, String password);

  Future<ClassModel> getRecordedCourses(String marhala);
  Future<List<Wehda>> getTutorials(int courseId);
  Future<String> askQuestion(String question);
  Future<Pair<List<Note>, List<Package>>> getNotes(String marhala);
  Future<Pair<List<Note>, List<Package>>> getAllCart(List<String> notesId, List<String> packagesId);
  Future<void> order(String userName, String phone, int cityId, String address, List<Note> notes, List<int> count, List<Package> packages, List<int> countPackage);
  Future<List<Teacher>> getTeachers();
  Future<List<City>> getCities();
  Future<List<UserCourses>> getSubscriptions(int userId);
  Future<void> addComment(String comment, int userId);
  Future<List<Comment>> getComments(int lessonId);
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
    if (data["user"]["user_type"] != 'user') {
      throw Exception(AppStrings.notStudent);
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
      courses.add(course);
    }

    return ClassModel(
        courses,
        []
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
  Future<Pair<List<Note>, List<Package>>> getNotes(String marhala) async {
    if (
      marhala == AppStrings.saff1 ||
      marhala == AppStrings.saff2 ||
      marhala == AppStrings.saff3
    ) {
      return const Pair([], []);
    }
    await _checkNetwork();

    String url = "${Constants.baseUrl}books";
    final response = await _dio.get(url);

    List<Note> notes = [];
    String s = convertSaff(marhala, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      notes.add(note);
    }

    List<Package> packages = [];
    s = convertSaff(marhala, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      packages.add(package);
    }

    return Pair(notes, packages);
  }

  @override
  Future<Pair<List<Note>, List<Package>>> getAllCart(List<String> notesId, List<String> packagesId) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}books";
    final response = await _dio.get(url);

    List<Note> notes = [];
    String s = convertSaff(AppStrings.saff4, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff5, 'book');
    for (var singleNote in response.data[s]) {
      Note note = Note.fromJson(singleNote);
      if (notesId.contains(note.id.toString())) notes.add(note);
    }
    s = convertSaff(AppStrings.saff6, 'book');
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

    List<Package> packages = [];
    s = convertSaff(AppStrings.saff4, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff5, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff6, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff7, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff8, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff9, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff10, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff11, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }
    s = convertSaff(AppStrings.saff12, 'package');
    for (var singleNote in response.data[s]) {
      Package package = Package.fromJson(singleNote);
      if (packagesId.contains(package.id.toString())) packages.add(package);
    }

    return Pair(notes, packages);
  }

  @override
  Future<void> order(String userName, String phone, int cityId, String address, List<Note> notes, List<int> count, List<Package> packages, List<int> countPackage) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}make/order/from/app";

    var items = [];
    int count1 = 0;
    for (var element in notes) {
      items.add({
        'book_id': element.id,
        'package_id': null,
        'quantity': count[count1],
        'price': element.bookPrice,
      });
      count1++;
    }
    count1 = 0;
    for (var element in packages) {
      items.add({
        'book_id': null,
        'package_id': element.id,
        'quantity': countPackage[count1],
        'price': element.price,
      });
      count1++;
    }

    var body =  {
      'buyer': userName,
      'phone': phone,
      'address': address,
      'city_id': cityId,
      'items': items,
    };

    await _dio.post(url, data: jsonEncode(body));
  }

  @override
  Future<List<Teacher>> getTeachers() async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}teacher/index";
    var response = await _dio.get(url);
    List<Teacher> teachers = TeacherResponse.fromJson(response.data).teacher ?? [];
    return teachers;
  }

  @override
  Future<List<City>> getCities() async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}cities/for/order";
    var response = await _dio.get(url);
    List<City> cities = CityResponse.fromJson(response.data).cities ?? [];
    return cities;
  }

  @override
  Future<List<UserCourses>> getSubscriptions(int userId) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}auth/subscription/$userId";
    var response = await _dio.get(url);
    List<UserCourses> userCourses = SubscriptionResponse.fromJson(response.data).courses ?? [];
    return userCourses;
  }

  @override
  Future<void> addComment(String comment, int userId) async {
    // TODO: implement getComments
  }

  @override
  Future<List<Comment>> getComments(int lessonId) async {
    // TODO: implement getComments
    return [
      Comment(comment: 'First Comment'),
      Comment(comment: 'Second Comment'),
    ];
  }
}