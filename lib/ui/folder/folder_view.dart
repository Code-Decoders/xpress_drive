import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/folder/folder_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/textfields/search_field.dart';
import 'package:xpress_drive/ui/widget/tiles/file_tile.dart';

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
              title: Text(folder.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            body:Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                    child: Column(
                      children: [
                        SearchField(
                          hint: 'Search File',
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 30.h),
                            itemBuilder: (context, index) {
                              return FileTile(
                                file: model.files[index],
                                color: color,
                              );
                            },
                            itemCount: model.files.length,
                          ),
                        ),
                      ],
                    ),
                  ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                shape: const CircleBorder(),
                color: color,
                child: InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(25.h),
                    child: Icon(
                      Icons.add,
                      size: 19.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
