import 'package:file_cryptor/file_cryptor.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';
import '../app/app.locator.dart';
import 'auth_service.dart';

@singleton
class EncryptionService {
  final _auth = locator<AuthService>();

  Future<File> encrypt(String filePath) async {
    FileCryptor fileCryptor = FileCryptor(
      key: "${_auth.pkey}",
      iv: 16,
      dir: "",
    );
    return await fileCryptor.encrypt(inputFile: filePath, outputFile: filePath);
  }

  Future<File> decrypt(String filePath) async {
    FileCryptor fileCryptor = FileCryptor(
      key: "${_auth.pkey}",
      iv: 16,
      dir: "",
    );
    return await fileCryptor.decrypt(inputFile: filePath, outputFile: filePath);
  }
}
