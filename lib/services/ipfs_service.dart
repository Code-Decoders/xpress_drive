import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/services/auth_service.dart';
import 'package:xpress_drive/services/encryption_service.dart';

@singleton
class IpfsService {
  late IpfsClient _ipfsClient;

  IpfsService() {
    _ipfsClient = IpfsClient(
      url: "https://u0huvbekn5-u0qu5ph2gb-ipfs.us0-aws.kaleido.io",
      authorizationToken:
          "dTB4NGpvYzJrcDpDSFZGQWdSMU9xSW5GOC13UzA5MmRjQThXZUhqTy1VOW5GcHU4bW8xMnpF",
    );
  }

  Future<bool> onCreateAccount() async {
    final auth = locator<AuthService>();
    final encryption = locator<EncryptionService>();

    final username = auth.username;
    final pkey = auth.pkey;
    var res = await _ipfsClient.mkdir(dir: "/$username");
    if (res is String) res = json.decode(res);
    if (res['Message'] != null) {
      throw Exception(res['Message']);
    } else {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      final File file = File('$tempPath/____file.txt');
      await file.writeAsString(pkey!);
      log("tempPath $tempPath");
      log("pkey $pkey");
      File fileEncrypted = await encryption.encrypt(file.path);
      _ipfsClient.write(dir: "/$username/pkey", filePath: fileEncrypted.path);
      return true;
    }
  }

  Future<bool> onSignIn() async {
    final auth = locator<AuthService>();
    final encryption = locator<EncryptionService>();
    var res = await _ipfsClient.getAllDirectories(dir: "/${auth.username}");
    if (res is String) res = json.decode(res);
    if (res['Message'] != null) {
      throw Exception(res['Message']);
    } else {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      final File file = File('$tempPath/____file.txt');
      var bytes = await _ipfsClient.read(dir: "/${auth.username}/pkey");
      file.writeAsBytesSync(bytes['data']);
      try {
        File deFile = await encryption.decrypt(file.path);
        String pkey = await deFile.readAsString();
        auth.pkey = pkey;
        return true;
      } catch (e) {
        throw Exception("Invalid password");
      }
    }
  }
}
