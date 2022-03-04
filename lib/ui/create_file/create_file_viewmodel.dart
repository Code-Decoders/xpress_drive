import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'dart:io' as io;

import 'package:xpress_drive/services/ipfs_service.dart';

class CreateFileViewModel extends BaseViewModel {
  late String _path;
  Map<String, dynamic> _file = {};
  io.File? _uploadFile;
  bool _isDiabled = true;
  Map<String, dynamic> get file => _file;
  io.File? get uploadFile => _uploadFile;
  bool get isDiabled => _isDiabled;

  CreateFileViewModel(String path) {
    _path = path;
  }
  void saveFile() {
    print('save folder');
    if (!_file['Name'].contains('.')) {
      _file['Name'] =
          _file['Name'] + '.' + _uploadFile!.uri.path.split('.').last;
    }
    print(_path);
    locator<IpfsService>()
        .uploadFile('$_path/${_file['Name']}', _uploadFile!.path);
    locator<AppRouter>().popTop(_file);
  }

  void setFile(String name) {
    _file = {..._file, 'Name': name};
    _isDiabled = name.isEmpty || _uploadFile == null;
    notifyListeners();
  }

  void setUploadFile(io.File file, TextEditingController controller) {
    _uploadFile = file;
    if ((_file['Name'] ?? '').isEmpty || controller.text.isEmpty) {
      _file['Name'] = (_uploadFile!.path.split('/').last.split(".")
            ..removeLast())
          .join(".");
      controller.text = _file['Name'];
      print(_file['Name']);
      notifyListeners();
    }
    _isDiabled = (_file['Name'] ?? '').isEmpty || _uploadFile == null;
    notifyListeners();
  }
}
