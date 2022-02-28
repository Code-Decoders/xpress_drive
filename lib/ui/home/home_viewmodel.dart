import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
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

  HomeViewModel() {}

  void setSearchText(String value) {
    _searchText = value;
    notifyListeners();
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

  void navigateToCreateFolder() async {
    var folder = await locator<AppRouter>().push(CreateFolderRoute());
    if (folder != null) {
      print(folder);
      _folders.add(folder as Folder);
      notifyListeners();
    }
  }
}
