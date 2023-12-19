import 'dart:convert';

import 'package:education/domain/models/courses/course.dart';
import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../core/constants.dart';
import '../../domain/models/courses/baqa.dart';
import '../../domain/models/courses/class_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {

  Future<ClassModel> getRecordedCourses(String marhala) async {

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

  // Future<> getTutorials() {
  // }

  Future<List<Course>> getSubscriptions() {
    return Future(() => []);
  }
}