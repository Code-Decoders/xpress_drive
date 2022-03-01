import 'package:biometric_storage/biometric_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.constants.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/services/auth_service.dart';
import 'package:xpress_drive/services/biometric_service.dart';

class LandingViewModel extends BaseViewModel {
  void navigateToLogin() {
    locator<AppRouter>().push(LoginRoute());
  }

  void smartId() async {
    var userInfo = await locator<BiometricService>().getKey();
    var auth = locator<AuthService>();
    auth.username = userInfo?.first;
    auth.pkey = userInfo?.last;

    if (await auth.checkAuth()) {
      locator<AppRouter>().push(const HomeRoute());
    }
  }

  void navigateToCreateAccount() {
    locator<AppRouter>().push(CreateAccountRoute());
  }
}
