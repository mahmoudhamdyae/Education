import 'dart:convert';

import 'package:education/presentation/resources/strings_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../core/app_prefs.dart';
import '../../core/constants.dart';
import 'package:http/http.dart' as http;

import '../../core/converts.dart';
import '../network_info.dart';

abstract class AccountService {
  Future register(String userName, String phone, String password, String grade, String group);
  Future logIn(String phone, String password);
  Future signOut();
}

class AccountServiceImpl implements AccountService {

  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;

  AccountServiceImpl(this._appPreferences, this._networkInfo);

  @override
  Future register(String userName, String phone, String password, String grade, String group) async {
    await _checkNetwork();
    String url = "${Constants.baseUrl}auth/register?name=$userName&password=$password&phone=$phone&grade=${convertMarhala(grade)}&group=${convertSaff(group)}";
    final response = await http.post(Uri.parse(url));

    final responseData = await json.decode(response.body);
    debugPrint('Register Response: $responseData');
    if (responseData["message"] == null) {
      throw Exception(AppStrings.previouslyUser);
    }
  }

  @override
  Future logIn(String phone, String password) async {
    await _checkNetwork();
    String url = "${Constants.baseUrl}auth/login?&password=$password&phone=$phone";
    final response = await http.post(Uri.parse(url));

    var responseData = json.decode(response.body);
    debugPrint('Login Response: $responseData');
    if (responseData["access_token"] == null) {
      throw Exception(AppStrings.wrongPhoneOrPassword);
    }
    _appPreferences.setUserId(responseData['user']['id']);
  }

  @override
  Future signOut() async {
    _appPreferences.setUserId(0);
  }

  _checkNetwork() async {
    if (await _networkInfo.isConnected) {
    } else {
      throw Exception(AppStrings.noInternetError);
    }
  }

  _checkServer(http.Response response) {
    if (response.statusCode != 200) {
      throw (Exception("لا يمكن الاتصال بالسيرفر"));
    }
  }
}