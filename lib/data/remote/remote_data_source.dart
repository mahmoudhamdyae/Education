import 'dart:convert';

import 'package:education/domain/models/courses/course.dart';
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
    for (var singleCourse in responseData["courses"]) {
      Course course = Course.fromJson(singleCourse);
      courses.add(course);
    }

    return Future(() => ClassModel(
        courses,
        [
          Baqa(8, 7, 60),
          Baqa(7, 0, 38),
        ]
    ));
  }

  Future<List<Course>> getSubscriptions() {
    return Future(() => []);
  }
}