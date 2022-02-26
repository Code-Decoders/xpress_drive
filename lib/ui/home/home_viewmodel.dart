import 'package:stacked/stacked.dart';

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

  String get searchText => _searchText;

  Filter get filter => _filter;

  View get view => _view;

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
