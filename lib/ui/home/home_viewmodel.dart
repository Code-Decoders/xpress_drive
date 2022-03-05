import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/app/app.enums.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/services/ipfs_service.dart';
import 'package:xpress_drive/ui/widget/color.dart';

import '../../services/auth_service.dart';

enum Filter {
  Recent,
  // Oldest,
  // A_TO_Z,
  // Z_TO_A,
}

class HomeViewModel extends BaseViewModel {
  String _searchText = "";

  Filter _filter = Filter.Recent;

  View _view = View.Grid;

  bool _isSpeedDialOpen = false;

  List<Map<String, dynamic>> _files = [];

  List<Map<String, dynamic>> _folders = [];

  String get searchText => _searchText;

  Filter get filter => _filter;

  View get view => _view;

  List<Map<String, dynamic>> get folders => _folders;

  List<Map<String, dynamic>> get files => _files;

  bool get isSpeedDialOpen => _isSpeedDialOpen;

  HomeViewModel() {
    setBusy(true);
    getDirectoryDetails();
  }

  void setSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  void deleteFile(int index) async {
    var data = await locator<DialogService>().showConfirmationDialog(
      cancelTitle: 'Cancel',
      title: 'Are you sure want to delete it?',
      confirmationTitle: 'Delete',
    );
    if (data != null) {
      if (data.confirmed) {
        locator<IpfsService>().delete(
            "/${locator<AuthService>().username}/${_files[index]['Name']}");
        _files.removeAt(index);
        notifyListeners();
      }
    }
  }

  void setFilter(Filter? value) {
    _filter = value!;
    notifyListeners();
  }

  void setView(View value) {
    _view = value;
    notifyListeners();
  }

  void navigateToFolder(int index) {
    var auth = locator<AuthService>();
    locator<AppRouter>().push(FolderRoute(
        path: '/${auth.username}',
        folder: _folders[index],
        color: (index + 1) % 4 == 0
            ? AppColor.green
            : (index + 1) % 4 == 3
                ? AppColor.red
                : (index + 1) % 4 == 2
                    ? AppColor.yellow
                    : AppColor.primaryDark));
  }

  void closeDrawer() {
    locator<AppRouter>().popTop();
  }

  void navigateToEditFolder(int index) async {
    var folder = await locator<AppRouter>().push(CreateFolderRoute(
      path: '/${locator<AuthService>().username}',
      folder: _folders[index],
    ));
    if (folder is Map<String, dynamic>) {
      _folders[index] = folder;
      notifyListeners();
    }
  }

  void navigateToCreateFile() async {
    var file = await locator<AppRouter>().push(CreateFileRoute(
      path: '/${locator<AuthService>().username}',
    ));
    if (file is Map<String, dynamic>) {
      print(file);
      _files.add(file);
      print(files);
      notifyListeners();
    }
  }

  void navigateToLanding() {
    locator<AppRouter>().popTop();
    locator<AppRouter>().pushAndPopUntil(
      const LandingRoute(),
      predicate: (route) => false,
    );
  }

  void navigateToCreateFolder() async {
    var folder = await locator<AppRouter>().push(CreateFolderRoute(
      path: '/${locator<AuthService>().username}',
    ));
    if (folder is Map<String, dynamic>) {
      print(folder);
      _folders.add(folder);
      notifyListeners();
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
        locator<IpfsService>().delete(
            "/${locator<AuthService>().username}/${_folders[index]['Name']}");
        _folders.removeAt(index);
        notifyListeners();
      }
    }
  }

  void openSpeedDial(bool value) {
    _isSpeedDialOpen = value;
    notifyListeners();
  }

  void getDirectoryDetails() async {
    var auth = locator<AuthService>();
    var res = List<Map<String, dynamic>>.from(
        await locator<IpfsService>().getDirectory('/${auth.username}'));
    _files = res.where((e) => e['Type'] == 'file').toList();
    _folders = res.where((e) => e['Type'] == 'directory').toList();
    setBusy(false);
  }

  openFile(Map<String, dynamic> file) {
    var auth = locator<AuthService>();
    locator<IpfsService>().openFile('/${auth.username}/${file['Name']}');
  }
}
