import 'dart:convert';
import 'dart:io';

import 'package:education/domain/models/courses/course.dart';
import 'package:education/domain/models/lesson/wehda.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../core/constants.dart';
import '../../domain/models/courses/baqa.dart';
import '../../domain/models/courses/class_model.dart';
import 'package:http/http.dart' as http;

import '../network_info.dart';

class RemoteDataSource {

  final NetworkInfo _networkInfo;
  RemoteDataSource(this._networkInfo);

  Future<ClassModel> getRecordedCourses(String marhala) async {
    await _checkNetworkAndServer();

    String url = "${Constants.baseUrl}courses";
    final response = await http.get(Uri.parse(url));

    final responseData = await json.decode(response.body);
    debugPrint('Get Recorded Courses Response: $responseData');

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
    for (var singleCourse in responseData[s]) {
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
    await _checkNetworkAndServer();

    String url = "${Constants.baseUrl}tutorial/$courseId";
    final response = await http.get(Uri.parse(url));

    final responseData = await json.decode(response.body);
    debugPrint('Get Tutorials Response: $responseData');

    List<Wehda> wehdat = [];
    for (var singleCourse in responseData['tutorial']) {
      Wehda wehda = Wehda.fromJson(singleCourse);
      wehdat.add(wehda);
    }

    return wehdat;
  }

  Future<List<Course>> getSubscriptions() async {
    await _checkNetworkAndServer();
    return Future(() => []);
  }

  Future<String> askQuestion(String question) async {
    await _checkNetworkAndServer();
    Future.delayed(const Duration(seconds: 4));
    return Future(() => '');
  }

  _checkNetworkAndServer() async {
    if (await _networkInfo.isConnected) {
      await _checkServer();
    } else {
      throw Exception(AppStrings.noInternetError);
    }
  }

  _checkServer() async {
    // try {
    //   final result = await InternetAddress.lookup(Constants.baseUrl);
    //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     debugPrint('connected');
    //   }
    // } on SocketException catch (_) {
    //   debugPrint(AppStrings.serverDown);
    //   throw Exception(AppStrings.serverDown);
    // }
  }
}