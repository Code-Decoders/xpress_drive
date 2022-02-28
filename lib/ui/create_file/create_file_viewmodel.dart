import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/datamodels/file.dart';
import 'dart:io' as io;

class CreateFileViewModel extends BaseViewModel {
  File _file = File(title: '', url: '');
  io.File? _uploadFile;
  bool _isDiabled = true;
  File get file => _file;
  io.File? get uploadFile => _uploadFile;
  bool get isDiabled => _isDiabled;

  CreateFileViewModel() {}

  void saveFile() {
    print('save folder');
    if (!_file.title.contains('.')) {
      _file.title = _file.title + '.' + _uploadFile!.uri.path.split('.').last;
    }
    locator<AppRouter>().popTop(_file);
  }

  void setFile(String name) {
    _file = _file.copyWith(title: name);
    _isDiabled = name.isEmpty || _uploadFile == null;
    notifyListeners();
  }

  void setUploadFile(io.File file) {
    _uploadFile = file;
    _isDiabled = _file.title.isEmpty || _uploadFile == null;
    notifyListeners();
  }
}
