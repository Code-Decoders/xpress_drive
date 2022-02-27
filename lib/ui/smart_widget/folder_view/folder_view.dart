import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';
import 'package:xpress_drive/services/strings.dart';

class FolderView extends StatelessWidget {
  final Color color;
  final Folder folder;
  final VoidCallback? onTap;
  const FolderView(
      {Key? key, required this.color, required this.folder, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.h),
      color: color.withOpacity(.15),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(20.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.h),
          ),
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    AppIcons.folder,
                    color: color,
                    size: 28.h,
                  ),
                  InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(8.0.h),
                        child: AppIcon(AppIcons.more, size: 15.h, color: color),
                      )),
                ],
              ),
              SizedBox(height: 14.h),
              Text(folder.title,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: color,
                      fontWeight: FontWeight.w500)),
              Text(
                '${folder.createdAt.monthFormat} ${folder.createdAt.day}.${folder.createdAt.year}',
                style: TextStyle(fontSize: 10.sp, color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
