import '../../core/app_prefs.dart';

abstract class AccountService {
  Future register(String userName, String phone, String password);
  Future logIn(String phone, String password);
  signOut();
}

class AccountServiceImpl implements AccountService {

  final AppPreferences _appPreferences;

  AccountServiceImpl(this._appPreferences);

  @override
  Future register(String userName, String phone, String password) async {
    print("REGISTER");
  }

  @override
  Future logIn(String phone, String password) async {
    print("LOGIN");
  }

  @override
  signOut() {
    _appPreferences.setToken("");
  }
}