import 'package:dio/dio.dart';
import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../core/app_prefs.dart';
import '../../core/constants.dart';
import '../../domain/models/courses/baqa.dart';
import '../../domain/models/courses/class_model.dart';

import '../network_info.dart';

abstract class RemoteDataSource {
  Future register(String userName, String phone, String password, String grade, String group);
  Future logIn(String phone, String password);
  Future signOut();
}

class RemoteDataSourceImpl extends RemoteDataSource {

  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;
  final Dio _dio;
  RemoteDataSourceImpl(this._networkInfo, this._appPreferences, this._dio);

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
  Future logIn(String phone, String password) async {
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
    _appPreferences.setUserId(data['user']['id']);
  }

  @override
  Future signOut() async {
    _appPreferences.setUserId(0);
  }

  Future<ClassModel> getRecordedCourses(String marhala) async {
    await _checkNetwork();

    String url = "${Constants.baseUrl}courses";
    final response = await _dio.get(url);

    List<Course> courses = [];
    String s = '';
    switch(marhala) {
      case AppStrings.saff6:
        s = 'coursesix';
        break;
      case AppStrings.saff7:
        s = 'courseseven';
        break;
      case AppStrings.saff8:
        s = 'courseeight';
        break;
      case AppStrings.saff9:
        s = 'coursenine';
        break;
      case AppStrings.saff10:
        s = 'courseten';
        break;
      case AppStrings.saff11:
        s = 'courseeleven';
        break;
      case AppStrings.saff12:
        s = 'coursetwelve';
        break;
    }
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

  Future<List<Course>> getSubscriptions() async {
    await _checkNetwork();
    return Future(() => []);
  }

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
}