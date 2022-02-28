import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';

class FolderTile extends StatelessWidget {
  final Color color;
  final Folder folder;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final View view;
  const FolderTile(
      {Key? key,
      required this.color,
      required this.folder,
      this.onTap,
      this.onDelete,
      required this.view,
      this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(view == View.Grid ? 20.h : 5.h),
      color: color.withOpacity(view == View.Grid ? .15 : .0),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(view == View.Grid ? 20.h : 5.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(view == View.Grid ? 20.h : 5.h),
          ),
          padding: EdgeInsets.all(16.h),
          child: view == View.Grid
              ? Column(
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
                        PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  onTap: () async {
                                    await locator<AppRouter>().popTop();
                                    onEdit?.call();
                                  },
                                  child: Text('Rename'),
                                  value: 'rename',
                                ),
                                PopupMenuItem(
                                  onTap: () async {
                                    await locator<AppRouter>().popTop();
                                    onDelete?.call();
                                  },
                                  child: Text('Delete'),
                                  value: 'delete',
                                ),
                              ];
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: AppIcon(AppIcons.more,
                                  size: 15.h, color: color),
                            )),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Text(folder.title,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: color,
                            fontWeight: FontWeight.w500)),
                  ],
                )
              : Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: AppIcon(
                        AppIcons.folder,
                        color: color,
                        size: 20.h,
                      ),
                    ),
                    Expanded(
                      child: Text(folder.title,
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: color,
                              fontWeight: FontWeight.w500)),
                    ),
                    PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              onTap: () async {
                                await locator<AppRouter>().popTop();
                                onEdit?.call();
                              },
                              child: Text('Rename'),
                              value: 'rename',
                            ),
                            PopupMenuItem(
                              onTap: () async {
                                await locator<AppRouter>().popTop();
                                onDelete?.call();
                              },
                              child: Text('Delete'),
                              value: 'delete',
                            ),
                          ];
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.h),
                          child:
                              AppIcon(AppIcons.more, size: 15.h, color: color),
                        )),
                  ],
                ),
        ),
      ),
    );
  }
}
