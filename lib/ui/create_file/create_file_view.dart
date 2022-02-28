import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/datamodels/file.dart';
import 'package:xpress_drive/ui/create_file/create_file_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/textfields/textfield.dart';
import 'dart:io' as io;

class CreateFileView extends StatelessWidget {
  const CreateFileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateFileViewModel>.reactive(
        viewModelBuilder: () => CreateFileViewModel(),
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
                    'Create File',
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: CustomField(
                    label: 'File Name',
                    hint: 'Enter File Name',
                    value: model.file.title,
                    onChanged: model.setFile,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.w),
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          io.File file = io.File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          border: Border.all(
                            color: AppColor.borderColor,
                            width: 2.w,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColor.primaryDark,
                            ),
                            Text(
                              'Add File',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primaryDark),
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(child: SizedBox.shrink()),
                Material(
                  color: model.isDiabled
                      ? AppColor.borderColor
                      : AppColor.primaryDark,
                  child: InkWell(
                    onTap: model.isDiabled ? null : model.saveFile,
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
