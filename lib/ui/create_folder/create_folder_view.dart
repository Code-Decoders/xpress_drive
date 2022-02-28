import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/create_folder/create_folder_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/textfields/textfield.dart';

class CreateFolderView extends StatelessWidget {
  final Folder? folder;
  const CreateFolderView({Key? key, this.folder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateFolderViewModel>.reactive(
        viewModelBuilder: () => CreateFolderViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leadingWidth: 90.w,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.primary,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    folder == null ? 'Create Folder' : 'Edit Folder',
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: CustomField(
                    label: 'Folder Name',
                    hint: 'Enter Folder Name',
                    value: model.folder.title,
                    onChanged: model.updateTitle,
                  ),
                ),
                Expanded(child: SizedBox.shrink()),
                Material(
                  color: model.isDiabled
                      ? AppColor.borderColor
                      : AppColor.primaryDark,
                  child: InkWell(
                    onTap: model.isDiabled ? null : model.saveFolder,
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
