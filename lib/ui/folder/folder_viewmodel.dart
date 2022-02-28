import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/datamodels/file.dart';
import 'package:xpress_drive/datamodels/folder.dart';

class FolderViewModel extends BaseViewModel {
  late Folder _folder;

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

  FolderViewModel(Folder folder) {
    _folder = folder;
  }
}
