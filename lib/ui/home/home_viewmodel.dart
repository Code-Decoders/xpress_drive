import 'package:stacked/stacked.dart';
import 'package:xpress_drive/datamodels/folder.dart';

enum Filter {
  Recent,
  Oldest,
  A_TO_Z,
  Z_TO_A,
}

enum View {
  List,
  Grid,
}

class HomeViewModel extends BaseViewModel {
  String _searchText = "";

  Filter _filter = Filter.Recent;

  View _view = View.Grid;

  final List<Folder> _folders = [
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 0),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 1),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 2),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 3),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 4),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 5),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 6),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 7),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 8),
    Folder(title: 'Mobile App', createdAt: DateTime.now(), type: 'folder', id: 9),
  ];


  String get searchText => _searchText;

  Filter get filter => _filter;

  View get view => _view;

  List<Folder> get folders => _folders;

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
}
