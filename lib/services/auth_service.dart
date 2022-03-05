import 'package:injectable/injectable.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/services/ipfs_service.dart';

@singleton
class AuthService {
  Future<bool> checkAuth() async {
    return await locator<IpfsService>().onSignIn();
  }

  String? username;
  String? pkey;
}
