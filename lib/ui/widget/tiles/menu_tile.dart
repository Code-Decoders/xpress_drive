import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/ui/widget/color.dart';

class MenuTile extends StatelessWidget {
  final String path;
  final String title;
  final VoidCallback? onTap;
  const MenuTile(
      {Key? key, required this.path, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool actived = (path ==
        (locator<AppRouter>().topMostRouter().currentChild?.path ?? ''));
    return Padding(
      padding: EdgeInsets.only(bottom: 21.h),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onTap ?? () {},
              child: Container(
                height: 33.h,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      height: 33.h,
                      width: 5.w,
                      color:
                          actived ? AppColor.primaryDark : Colors.transparent,
                    ),
                    SizedBox(
                      width: 21.w,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight:
                              !actived ? FontWeight.w500 : FontWeight.bold,
                          color: AppColor.primary),
                    ),
                  ],
                ),
              ))),
    );
  }
}
