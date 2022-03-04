import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
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
    EasyLoading.show(status: "Creating account...");
    final auth = locator<AuthService>();
    final encryption = locator<EncryptionService>();

    final username = auth.username;
    final pkey = auth.pkey;
    var res = await _ipfsClient.mkdir(dir: "/$username");
    if (res is String) res = json.decode(res);
    if (res['Message'] != null) {
      if (res['Message'] == 'file already exists') {
        res['Message'] = 'Account already exists';
      }
      EasyLoading.showError(res['Message']);
      locator<AppRouter>().popTop();
      return false;
    } else {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      final File file = File('$tempPath/____file.txt');
      await file.writeAsString(pkey!);
      log("tempPath $tempPath");
      log("pkey $pkey");
      File fileEncrypted = await encryption.encrypt(file.path);
      _ipfsClient.write(dir: "/$username/pkey", filePath: fileEncrypted.path);
      EasyLoading.dismiss();
      return true;
    }
  }

  Future<bool> onSignIn() async {
    EasyLoading.show(status: "Signing in...");
    final auth = locator<AuthService>();
    final encryption = locator<EncryptionService>();
    var res = await _ipfsClient.ls(dir: "/${auth.username}");
    if (res is String) res = json.decode(res);
    if (res['Message'] != null) {
       if (res['Message'] == 'file already exists') {
        res['Message'] = 'Incorrect username or password';
      }
      EasyLoading.showError(res['Message']);
      return false;
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
        EasyLoading.dismiss();
        return true;
      } catch (e) {
        EasyLoading.showError("Incorrect username or password");
        return false;
      }
    }
  }

  Future getDirectory(String path) async {
    var res = await _ipfsClient.ls(dir: path);
    if (res is Map) {
      final entries =
          List<Map<String, dynamic>>.from((jsonDecode(res['data'])??{'a':''})['Entries']??[]);
      List<Map<String, dynamic>> data =
          await Future.wait(entries.map((e) async {
        var res = await _ipfsClient.stat(dir: "$path/${e['Name']}");
        if (res is String) res = json.decode(res);
        if (res['Message'] != null) {
          throw Exception(res['Message']);
        } else {
          var json = jsonDecode(res['data']);
          return {...e, ...json};
        }
      }));
      data.removeWhere((element) => element['Name'] == 'pkey');
      return List<Map<String, dynamic>>.from(data);
    }
    return [];
  }

  Future<void> uploadFile(String dir, String filePath) async {
    EasyLoading.show(status: "Encrypting...");
    var file = await locator<EncryptionService>().encrypt(filePath);
    EasyLoading.show(status: "Uploading file...");
    await _ipfsClient.write(dir: dir, filePath: file.path);
    EasyLoading.showSuccess("File uploaded");
  }

  Future<void> createFolder(String dir) async {
    EasyLoading.show(status: "Creating Folder...");
    await _ipfsClient.mkdir(dir: dir);
    EasyLoading.showSuccess("Folder Created");
  }

  Future<void> delete(String path) async {
    EasyLoading.show(status: "Deleting...");
    await _ipfsClient.remove(dir: path);
    EasyLoading.showSuccess("Deleted");
  }

  Future<void> move(String oldPath, String newPath) async {
    EasyLoading.show(status: "Renaming...");
    await _ipfsClient.mv(oldPath: oldPath, newPath: newPath);
    EasyLoading.showSuccess("Renamed");
  }

  Future<void> openFile(String path) async {
    EasyLoading.show(status: "Opening file...");
    var encBytes = await _ipfsClient.read(dir: path);
    var name = path.split("/").last;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final File tempfile = File('$tempPath/$name');
    await tempfile.writeAsBytes(encBytes['data']);
    var file = await locator<EncryptionService>().decrypt(tempfile.path);
    print(file.path);
    EasyLoading.dismiss();
    OpenFile.open(file.path);
  }
}
