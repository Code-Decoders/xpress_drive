import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';

class SearchField extends HookWidget {
  final String hint;
  final Function(String)? onChanged;
  final String? value;
  const SearchField({
    Key? key,
    required this.hint,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value);
    return Container(
      height: 55.h,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.primary,
        ),
        cursorColor: AppColor.primary,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.primary,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(color: AppColor.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(color: AppColor.borderColor)),
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(19.h, 19.h, 6.h, 19.h),
            child: AppIcon(
              AppIcons.search,
              color: AppColor.primary,
              size: 20.h,
            ),
          ),
          prefixIconConstraints:
              BoxConstraints(maxHeight: 55.h, maxWidth: 55.h),
        ),
      ),
    );
  }
}
