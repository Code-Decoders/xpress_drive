import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';

class Dropdown<T> extends StatelessWidget {
  final List<T> items;
  final T value;
  final Function(T?)? onChanged;
  final Widget Function(T)? itemBuilder;
  const Dropdown(
      {Key? key,
      required this.items,
      required this.value,
      this.onChanged,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: DropdownButtonFormField<T>(
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          value: value,
          items: items
              .map((e) => DropdownMenuItem<T>(
                    child: itemBuilder!(e),
                    value: e,
                  ))
              .toList(),
          elevation: 1,
          dropdownColor: Colors.white,
          icon: AppIcon(
            AppIcons.arrow_down,
            size: 8.h,
            color: AppColor.primary,
          ),
          onChanged: onChanged),
    );
  }
}
