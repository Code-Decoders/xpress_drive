import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/datamodels/file.dart';
import 'dart:io' as io;

class CreateFileViewModel extends BaseViewModel {
  File _file = new File(title: '', url: '');
  io.File? _uploadFile;
  bool _isDiabled = true;
  File get file => _file;
  io.File? get uploadFile => _uploadFile;
  bool get isDiabled => _isDiabled;

  CreateFileViewModel() {}

  void saveFile() {
    print('save folder');
    locator<AppRouter>().popTop(_file);
  }

  void setFile(String name) {
    _file = _file.copyWith(title: name);
    _isDiabled = name.isEmpty;
    notifyListeners();
  }
}
