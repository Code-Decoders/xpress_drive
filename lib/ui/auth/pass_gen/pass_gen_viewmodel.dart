import 'dart:math';

import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/services/biometric_service.dart';
import 'package:xpress_drive/services/ipfs_service.dart';

import '../../../services/auth_service.dart';

class PassGenViewModel extends BaseViewModel {
  String _password = '';
  String _username = '';
  PassGenViewModel(String username) {
    _username = username;
    _generatePassword();
  }

  String get password => _password;

  void _generatePassword() {
    _password = getRandomString(32);
  }

  void navigateToHome() {
    // navigate to home
    locator<AppRouter>().push(const HomeRoute());
  }

  void smartLogin() {
    locator<BiometricService>().storePkey(_username, _password);
  }

  Future<void> createAcount() async {
    var auth = locator<AuthService>();
    auth.username = _username;
    auth.pkey = _password;
    if (await locator<IpfsService>().onCreateAccount()) {
      locator<AppRouter>().navigate(const HomeRoute());
    }
  }

  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
