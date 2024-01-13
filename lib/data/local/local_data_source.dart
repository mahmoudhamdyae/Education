import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<void> setUserLoggedIn();
  Future<bool> isUserLoggedIn();
  Future<void> logout();
  Future<void> setUserId(int id);
  Future<int> getUserId();
}

const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsUserId = "PREFS_USER_ID";

class LocalDataSourceImpl extends LocalDataSource {

  final SharedPreferences _sharedPreferences;
  LocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  @override
  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
    setUserId(0);
  }

  @override
  Future<void> setUserId(int id) async {
    _sharedPreferences.setInt(prefsUserId, id);
  }

  @override
  Future<int> getUserId() async {
    return _sharedPreferences.getInt(prefsUserId) ?? 0;
  }
}