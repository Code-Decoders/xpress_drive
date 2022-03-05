import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';

import '../../../services/auth_service.dart';

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

  Future<void> login() async {
    var auth = locator<AuthService>();
    auth.username = _username;
    auth.pkey = _password;
    if (await auth.checkAuth()) {
      locator<AppRouter>()
          .pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
    }
  }
}
