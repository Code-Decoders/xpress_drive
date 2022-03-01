import 'package:injectable/injectable.dart';

@singleton
class AuthService {
  Future<bool> checkAuth() async {
    return true;
  }

  String? username;
  String? pkey;
}
