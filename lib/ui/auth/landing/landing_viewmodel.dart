import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';

class LandingViewModel extends BaseViewModel {
  void navigateToLogin() {
    locator<AppRouter>().push(LoginRoute());
  }

  void navigateToCreateAccount() {
    locator<AppRouter>().push(CreateAccountRoute());
  }
}
