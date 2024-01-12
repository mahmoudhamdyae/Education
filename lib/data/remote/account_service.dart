import 'package:education/presentation/resources/strings_manager.dart';

import '../../core/app_prefs.dart';
import '../../core/constants.dart';
import 'package:dio/dio.dart';

import '../network_info.dart';

abstract class AccountService {
  Future register(String userName, String phone, String password, String grade, String group);
  Future logIn(String phone, String password);
  Future signOut();
}

class AccountServiceImpl implements AccountService {

  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;
  final Dio _dio;

  AccountServiceImpl(this._appPreferences, this._networkInfo, this._dio);

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

  _checkNetwork() async {
    if (!await _networkInfo.isConnected) {
      throw Exception(AppStrings.noInternetError);
    }
  }
}