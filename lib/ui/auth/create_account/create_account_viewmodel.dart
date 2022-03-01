import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';

class CreateAccountViewModel extends BaseViewModel {
  String _username = '';
  bool _isDiabled = false;

  String get username => _username;
  bool get isDiabled => _isDiabled;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setIsDiabled(bool isDiabled) {
    _isDiabled = isDiabled;
    notifyListeners();
  }

  void signup() {
    locator<AppRouter>().navigate(const PassGenRoute());
  }
}
