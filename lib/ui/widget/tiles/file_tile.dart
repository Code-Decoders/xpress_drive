import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/datamodels/file.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';

class FileTile extends StatelessWidget {
  final File file;
  final Color color;
  final VoidCallback? onTap;
  const FileTile({
    Key? key,
    required this.file,
    this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5.h),
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(5.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.h),
          ),
          padding: EdgeInsets.all(16.h),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Image.network(
                    'https://cdn2.iconfinder.com/data/icons/file-formats-3-1/100/file_formats3_${file.title.split('.')[1]}-128.png',
                    height: 30.h,
                    width: 30.h,
                    errorBuilder: (_, __, ___) => Image.network(
                      'https://cdn0.iconfinder.com/data/icons/aami-web-internet/64/simple-42-128.png',
                      height: 30.h,
                      width: 30.h,
                    ),
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(file.title,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: color,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              AppIcon(AppIcons.more, size: 15.h, color: color),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
