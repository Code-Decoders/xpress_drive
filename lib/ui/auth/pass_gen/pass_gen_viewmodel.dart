import 'dart:math';

import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';

class PassGenViewModel extends BaseViewModel {
  String _password = '';

  PassGenViewModel() {
    _generatePassword();
  }

  String get password => _password;

  void _generatePassword() {
    _password = '';
    for (int i = 0; i < 8; i++) {
      _password += Random().nextInt(10).toString();
    }
  }

  void navigateToHome() {
    // navigate to home
    locator<AppRouter>().push(HomeRoute());
  }
}
