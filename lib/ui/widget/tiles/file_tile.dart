import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/app/app.enums.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';

class FileTile extends StatelessWidget {
  final Map<String, dynamic> file;
  final Color color;
  final View view;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  const FileTile({
    Key? key,
    required this.file,
    required this.view,
    this.onTap,
    required this.color,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(view == View.Grid ? 20.h : 5.h),
      color: AppColor.primaryLight.withOpacity(view == View.Grid ? 1 : .0),
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
                        Image.network(
                          'https://cdn2.iconfinder.com/data/icons/file-formats-3-1/100/file_formats3_${file['Name'].split('.').length < 2 ? '' : (file['Name'].split('.').last)}-128.png',
                          height: 40.h,
                          width: 40.h,
                          errorBuilder: (_, __, ___) => Image.network(
                            'https://cdn0.iconfinder.com/data/icons/aami-web-internet/64/simple-42-128.png',
                            height: 40.h,
                            width: 40.h,
                          ),
                        ),
                        PopupMenuButton(
                            itemBuilder: (context) {
                              return [
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
                    Text(file['Name'],
                    overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize: 15.sp,
                            color: color,
                            fontWeight: FontWeight.w500)),
                  ],
                )
              : Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Image.network(
                          'https://cdn2.iconfinder.com/data/icons/file-formats-3-1/100/file_formats3_${file['Name'].split('.').length < 2 ? '' : (file['Name'].split('.').last)}-128.png',
                          height: 30.h,
                          width: 30.h,
                          errorBuilder: (_, __, ___) => Image.network(
                            'https://cdn0.iconfinder.com/data/icons/aami-web-internet/64/simple-42-128.png',
                            height: 30.h,
                            width: 30.h,
                          ),
                        )),
                    Expanded(
                      child: Text(file['Name'],
                          style: TextStyle(
                              fontFamily: 'Gilroy-Medium',
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
    ;
  }
}
