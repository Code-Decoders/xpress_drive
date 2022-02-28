import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/datamodels/file.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/widget/color.dart';

class FolderViewModel extends BaseViewModel {
  late Folder _folder;

  View _view = View.Grid;

  List<Folder> _subFolders = [
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

  Folder get folder => _folder;

  List<File> get files => _files;

  List<Folder> get subFolders => _subFolders;

  View get view => _view;

  FolderViewModel(Folder folder) {
    _folder = folder;
  }

  void navigateToCreateFolder() async {
    var folder = await locator<AppRouter>().push(CreateFolderRoute());
    if (folder != null) {
      print(folder);
      _subFolders.add(folder as Folder);
      notifyListeners();
    }
  }

  void navigateToFolder(int index) {
    print('Navigating to folder $index');
    locator<AppRouter>().push(FolderRoute(
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
      folder: _subFolders[index],
    ));
    if (folder != null) {
      _subFolders[index] = folder as Folder;
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
        _subFolders.removeAt(index);
        notifyListeners();
      }
    }
  }

  void navigateToCreateFile() async {
    var file = await locator<AppRouter>().push(CreateFileRoute());
    if (file != null) {
      print(file);
      _files.add(file as File);
      notifyListeners();
    }
  }

  void setView(View view) {
    _view = view;
    notifyListeners();
  }
}
