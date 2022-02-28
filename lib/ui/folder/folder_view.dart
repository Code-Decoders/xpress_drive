import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/folder/folder_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';
import 'package:xpress_drive/ui/widget/textfields/search_field.dart';
import 'package:xpress_drive/ui/widget/tiles/file_tile.dart';
import 'package:xpress_drive/ui/widget/tiles/folder_tile.dart';

class FolderView extends StatelessWidget {
  final Folder folder;
  final Color color;
  const FolderView({Key? key, required this.folder, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FolderViewModel>.reactive(
        viewModelBuilder: () => FolderViewModel(folder),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: color,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(ScreenUtil().setHeight(20)),
                child: SizedBox.shrink(),
              ),
              title: Text(folder.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Column(
                children: [
                  SearchField(
                    hint: 'Search File',
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(child: SizedBox.fromSize()),
                      InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          model.setView(View.List);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.h),
                          child: AppIcon(AppIcons.list,
                              size: 15.h,
                              color: AppColor.primary.withOpacity(
                                  model.view == View.List ? 1 : 0.5)),
                        ),
                      ),
                      InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          model.setView(View.Grid);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.h),
                          child: AppIcon(AppIcons.grid,
                              size: 15.h,
                              color: AppColor.primary.withOpacity(
                                  model.view == View.Grid ? 1 : 0.5)),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: model.view == View.List ? 1 : 2,
                          childAspectRatio: model.view == View.Grid ? 1.37 : 5,
                          crossAxisSpacing: 20.h,
                          mainAxisSpacing: model.view == View.List ? 0 : 20.h),
                      itemBuilder: (context, index) {
                        if (index < model.subFolders.length) {
                          return FolderTile(
                            view: model.view,
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
                          view: model.view,
                          file: model.files[index - model.subFolders.length],
                          color: color,
                          onDelete: () {
                            model.onDelete(index - model.subFolders.length);
                          },
                        );
                      },
                      itemCount: model.files.length + model.subFolders.length,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: SpeedDial(
              direction: SpeedDialDirection.left,
              children: [
                SpeedDialChild(
                    child: const Icon(
                      Icons.add,
                    ),
                    backgroundColor: AppColor.primary,
                    foregroundColor: Colors.white,
                    label: 'Folder',
                    onTap: model.navigateToCreateFolder),
                SpeedDialChild(
                  child: const Icon(Icons.add),
                  backgroundColor: AppColor.primary,
                  foregroundColor: Colors.white,
                  label: 'File',
                  onTap: model.navigateToCreateFile,
                ),
              ],
              backgroundColor: AppColor.primary,
              activeIcon: Icons.menu,
              child: Icon(
                Icons.add,
                size: 19.h,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
