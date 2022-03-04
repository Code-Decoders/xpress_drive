import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/app/app.enums.dart';
import 'package:xpress_drive/ui/folder/folder_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/tiles/file_tile.dart';
import 'package:xpress_drive/ui/widget/tiles/folder_tile.dart';

class FolderView extends StatelessWidget {
  final Map<String, dynamic> folder;
  final String path;
  final Color color;
  const FolderView(
      {Key? key, required this.folder, required this.color, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FolderViewModel>.reactive(
        viewModelBuilder: () => FolderViewModel(folder, path),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: color,
              elevation: 0,
              // bottom: PreferredSize(
              //   preferredSize: Size.fromHeight(ScreenUtil().setHeight(20)),
              //   child: const SizedBox.shrink(),
              // ),
              title: Text(folder['Name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            body: ListView.builder(
              padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 0),
              itemBuilder: (context, index) {
                if (index < model.subFolders.length) {
                  return FolderTile(
                    view: View.List,
                    folder: model.subFolders[index],
                    onTap: () {
                      model.navigateToFolder(index);
                    },
                    onEdit: () {
                      model.navigateToEditFolder(index);
                    },
                    onDelete: () {
                      model.onDelete(index);
                    },
                    color: (index + 1) % 4 == 0
                        ? AppColor.green
                        : (index + 1) % 4 == 3
                            ? AppColor.red
                            : (index + 1) % 4 == 2
                                ? AppColor.yellow
                                : AppColor.primaryDark,
                  );
                }
                return FileTile(
                  view: View.List,
                  file: model.files[index - model.subFolders.length],
                  color: color,
                  onDelete: () {
                    model.deleteFile(index - model.subFolders.length);
                  },
                );
              },
              itemCount: model.files.length + model.subFolders.length,
            ),
            floatingActionButton: SpeedDial(
              direction: SpeedDialDirection.up,
              children: [
                SpeedDialChild(
                    child: const Icon(
                      Icons.create_new_folder_outlined,
                    ),
                    backgroundColor: AppColor.primary,
                    foregroundColor: Colors.white,
                    label: 'Create Folder',
                    onTap: model.navigateToCreateFolder),
                SpeedDialChild(
                  child: const Icon(Icons.upload_file_outlined),
                  backgroundColor: AppColor.primary,
                  foregroundColor: Colors.white,
                  label: 'Upload File',
                  onTap: model.navigateToCreateFile,
                ),
              ],
              backgroundColor: AppColor.primary,
              activeIcon: Icons.menu,
              icon: Icons.add,
            ),
          );
        });
  }
}
