import '../../core/app_prefs.dart';

abstract class AccountService {
  Future signUp(String userName, String password, String repeatedPassword, String phone);
  // Future logIn(String phone, String password, {String userName});
  Future signOut();
}

class AccountServiceImpl implements AccountService {

  final AppPreferences _appPreferences;

  AccountServiceImpl(this._appPreferences);

  // @override
  // Future logIn(String phone, String password, String userName) {
  //   // TODO: implement logIn
  //   throw UnimplementedError();
  // }

  @override
  Future signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future signUp(String userName, String password, String repeatedPassword,
      String phone) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}