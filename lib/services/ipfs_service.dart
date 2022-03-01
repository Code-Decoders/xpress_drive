import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/services/auth_service.dart';

@singleton
class IpfsService {
  late IpfsClient _ipfsClient;
  IpfsService.init() {
    _ipfsClient = IpfsClient(
      url: "https://u0huvbekn5-u0qu5ph2gb-ipfs.us0-aws.kaleido.io/",
      authorizationToken:
          "dTB4NGpvYzJrcDpDSFZGQWdSMU9xSW5GOC13UzA5MmRjQThXZUhqTy1VOW5GcHU4bW8xMnpF",
    );
  }

  Future<bool> onCreateAccount() async {
    final auth = locator<AuthService>();
    final username = auth.username;
    final pkey = auth.pkey;
    var res = await _ipfsClient.mkdir(dir: "/$username");
    if (res['Error'] != null) {
      throw Exception(res['Error']);
      return false;
    } else {
      var file = File('');
      file.writeAsStringSync(pkey!);
      _ipfsClient.write(dir: "/$username/pkey", filePath: file.path);
      return true;
    }
  }
}
