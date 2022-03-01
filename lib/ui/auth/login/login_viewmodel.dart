import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  String _username = '';
  String _password = '';
  bool _isDiabled = false;

  String get username => _username;
  String get password => _password;
  bool get isDiabled => _isDiabled;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setIsDiabled(bool isDiabled) {
    _isDiabled = isDiabled;
    notifyListeners();
  }

  void login() {
    if (_username == 'admin' && _password == 'admin') {
      locator<AppRouter>().navigate(const HomeRoute());
    }
  }
}
