import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/services/ipfs_service.dart';

class CreateFolderViewModel extends BaseViewModel {
  late String _path;
  late String? _oldName;
  Map<String, dynamic> _folder = {};

  Map<String, dynamic> get folder => _folder;

  bool _isDiabled = false;

  bool get isDiabled => _isDiabled;

  CreateFolderViewModel(
      {Map<String, dynamic>? folder, required String path, String? oldName}) {
    if (folder != null) {
      print('folder is not null');
      _folder = folder;
    } else {
      _isDiabled = true;
    }
    _path = path;
    _oldName = oldName;
    notifyListeners();
  }

  void updateTitle(String title) {
    _folder = {
      ..._folder,
      'Name': title,
    };
    _isDiabled = title.isEmpty;
    notifyListeners();
  }

  void updateDescription(String description) {
    notifyListeners();
  }

  void saveFolder() {
    if (_oldName == null || _oldName == '') {
      locator<IpfsService>().createFolder('$_path/${_folder['Name']}');
    } else {
      locator<IpfsService>()
          .move('$_path/$_oldName', '$_path/${_folder['Name']}');
    }
    locator<AppRouter>().popTop(_folder);
  }
}
