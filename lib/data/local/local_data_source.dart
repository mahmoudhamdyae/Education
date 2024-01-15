import 'package:hive/hive.dart';

abstract class LocalDataSource {
  Future<void> setUserLoggedIn();
  bool isUserLoggedIn();
  Future<void> signOut();
  Future<void> setUserId(int id);
  int getUserId();
  Future<void> setUserName(String name);
  String getUserName();
}

const String keyIsUserLoggedIn = "KEY_IS_USER_LOGGED_IN";
const String keyUserId = "KEY_USER_ID";
const String keyUserName = "KEY_USER_NAME";

class LocalDataSourceImpl extends LocalDataSource {

  final Box _box;
  LocalDataSourceImpl(this._box);

  @override
  Future<void> setUserLoggedIn() async {
    return await _box.put(keyIsUserLoggedIn, true);
  }

  @override
  bool isUserLoggedIn() {
    return _box.get(keyIsUserLoggedIn, defaultValue: false);
  }

  @override
  Future<void> signOut() async {
    await _box.put(keyIsUserLoggedIn, false);
    setUserId(0);
  }

  @override
  Future<void> setUserId(int id) async {
    return await _box.put(keyUserId, id);
  }

  @override
  int getUserId() {
    return _box.get(keyUserId, defaultValue: 0);
  }

  @override
  Future<void> setUserName(String name) async {
    return await _box.put(keyUserName, name);
  }

  @override
  String getUserName() {
    return _box.get(keyUserName, defaultValue: '');
  }
}