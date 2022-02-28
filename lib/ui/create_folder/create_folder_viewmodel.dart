import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/datamodels/folder.dart';

class CreateFolderViewModel extends BaseViewModel {
  Folder _folder = Folder(title: '');

  Folder get folder => _folder;

  bool _isDiabled = false;

  bool get isDiabled => _isDiabled;

  CreateFolderViewModel({Folder? folder}) {
    if (folder != null) {
      print('folder is not null');
      _folder = folder;
    } else {
      _isDiabled = true;
    }
    notifyListeners();
  }

  void updateTitle(String title) {
    _folder = _folder.copyWith(title: title);
    _isDiabled = title.isEmpty;
    notifyListeners();
  }

  void updateDescription(String description) {
    _folder = _folder.copyWith(description: description);
    notifyListeners();
  }

  void saveFolder() {
    print('save folder');
    locator<AppRouter>().popTop(_folder);
  }
}
