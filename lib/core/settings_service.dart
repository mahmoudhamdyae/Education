import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsUserId = "PREFS_USER_ID";

class SettingsService extends GetxService {

  late SharedPreferences _sharedPreferences;

  Future<SettingsService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  // Authentication

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  Future<void> setUserId(int id) async {
    _sharedPreferences.setInt(prefsUserId, id);
  }

  Future<int> getUserId() async {
    return _sharedPreferences.getInt(prefsUserId) ?? 0;
  }
}