import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/services/auth_service.dart';
import 'package:xpress_drive/services/ipfs_service.dart';
import 'package:xpress_drive/ui/widget/color.dart';

class FolderViewModel extends BaseViewModel {
  late String _path;

  late Map<String, dynamic> _folder;

  List<Map<String, dynamic>> _subFolders = [];

  Map<String, dynamic> get folder => _folder;

  List<Map<String, dynamic>> _files = [];

  List<Map<String, dynamic>> get files => _files;

  List<Map<String, dynamic>> get subFolders => _subFolders;

  FolderViewModel(Map<String, dynamic> folder, String path) {
    _folder = folder;
    _path = path;
    setBusy(true);
    getDirectoryDetails();
  }

  void navigateToCreateFolder() async {
    var folder = await locator<AppRouter>().push(CreateFolderRoute(
      path: _path + '/' + _folder['Name'],
    ));
    if (folder is Map<String, dynamic>) {
      _subFolders.add(folder);
      notifyListeners();
    }
  }

  void navigateToFolder(int index) {
    locator<AppRouter>().push(FolderRoute(
        path: '$_path/${_subFolders[index]['name']}',
        folder: _subFolders[index],
        color: (index + 1) % 4 == 0
            ? AppColor.green
            : (index + 1) % 4 == 3
                ? AppColor.red
                : (index + 1) % 4 == 2
                    ? AppColor.yellow
                    : AppColor.primaryDark));
  }

  void navigateToEditFolder(int index) async {
    print('Navigating to edit folder $index');
    var folder = await locator<AppRouter>().push(CreateFolderRoute(
      path: _path+'/'+_subFolders[index]['name'],
      folder: _subFolders[index],
    ));
    if (folder is Map<String, dynamic>) {
      _subFolders[index] = folder;
      notifyListeners();
    }
  }

  void deleteFile(int index) async {
    var data = await locator<DialogService>().showConfirmationDialog(
      cancelTitle: 'Cancel',
      title: 'Are you sure want to delete it?',
      confirmationTitle: 'Delete',
    );
    if (data != null) {
      if (data.confirmed) {
        print('Deleting');
        locator<IpfsService>()
            .delete("$_path/${_folder['Name']}/${_files[index]['Name']}");
        _files.removeAt(index);
        notifyListeners();
      }
    }
  }

  void onDelete(int index) async {
    var data = await locator<DialogService>().showConfirmationDialog(
      cancelTitle: 'Cancel',
      title: 'Are you sure want to delete it?',
      confirmationTitle: 'Delete',
    );
    if (data != null) {
      if (data.confirmed) {
        print('Deleting');
        locator<IpfsService>()
            .delete("$_path/${_folder['Name']}/${_subFolders[index]['name']}");
      _subFolders.removeAt(index);
        notifyListeners();
      }
    }
  }

  void navigateToCreateFile() async {
    var file = await locator<AppRouter>().push(CreateFileRoute(
      path: _path + '/' + _folder['Name'],
    ));
    if (file is Map<String, dynamic>) {
      print(file);
      _files.add(file);
      notifyListeners();
    }
  }

  void getDirectoryDetails() async {
    var res = List<Map<String, dynamic>>.from(await locator<IpfsService>()
        .getDirectory('/$_path/${_folder['Name']}'));
    _files = res.where((e) => e['Type'] == 'file').toList();
    _subFolders = res.where((e) => e['Type'] == 'directory').toList();
    setBusy(false);
  }

   openFile(Map<String, dynamic> file,) {
    var auth = locator<AuthService>();
    locator<IpfsService>().openFile('$_path/${_folder['Name']}/${file['Name']}');
  }
}
