import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/datamodels/file.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/widget/color.dart';

enum Filter {
  Recent,
  Oldest,
  A_TO_Z,
  Z_TO_A,
}

class HomeViewModel extends BaseViewModel {
  String _searchText = "";

  Filter _filter = Filter.Recent;

  View _view = View.Grid;

  bool _isSpeedDialOpen = false;

  final List<File> _files = [
    File(
      title: 'Project.png',
      url: 'https://www.google.com/',
    ),
    File(
      title: 'Project.gif',
      url: 'https://www.google.com/',
    ),
    File(
      title: 'Project.pdf',
      url: 'https://www.google.com/',
    ),
    File(
      title: 'Project.jpeg',
      url: 'https://www.google.com/',
    ),
    File(
      title: 'Project.mp4',
      url: 'https://www.google.com/',
    ),
    File(
      title: 'Project.mp3',
      url: 'https://www.google.com/',
    ),
    File(
      title: 'Project.doc',
      url: 'https://www.google.com/',
    ),
    File(
      title: 'Project.aec',
      url: 'https://www.google.com/',
    ),
  ];

  final List<Folder> _folders = [
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
    Folder(
      title: 'Mobile App',
    ),
  ];

  String get searchText => _searchText;

  Filter get filter => _filter;

  View get view => _view;

  List<Folder> get folders => _folders;

  List<File> get files => _files;

  bool get isSpeedDialOpen => _isSpeedDialOpen;

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
    print('Navigating to folder $index');
    locator<AppRouter>().push(FolderRoute(
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
    print('Navigating to edit folder $index');
    var folder = await locator<AppRouter>().push(CreateFolderRoute(
      folder: _folders[index],
    ));
    if (folder != null) {
      _folders[index] = folder as Folder;
      notifyListeners();
    }
  }

  void navigateToCreateFile() async {
    var file = await locator<AppRouter>().push(CreateFileRoute());
    if (file != null) {
      _files.add(file as File);
      notifyListeners();
    }
  }

  void navigateToCreateFolder() async {
    var folder = await locator<AppRouter>().push(CreateFolderRoute());
    if (folder != null) {
      print(folder);
      _folders.add(folder as Folder);
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
        _folders.removeAt(index);
        notifyListeners();
      }
    }
  }

  void openSpeedDial(bool value) {
    _isSpeedDialOpen = value;
    notifyListeners();
  }
}
