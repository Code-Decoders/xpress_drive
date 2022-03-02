import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpress_drive/ui/widget/color.dart';

class CustomField extends HookWidget {
  final String label;
  final String? hint;
  final String value;
  final bool disabled;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int maxLines;
  final Function(String)? onChanged;
  const CustomField(
      {Key? key,
      this.onChanged,
      this.validator,
      this.disabled = false,
      required this.label,
      this.obscureText = false,
      this.maxLines = 1,
      this.hint,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value);
    print(value);
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.w500,
                color: AppColor.primary),
          ),
          SizedBox(height: 4.h),
          TextFormField(
            validator: validator,
            obscureText: obscureText,
            readOnly: disabled,
            maxLines: maxLines,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.h),
                  borderSide: BorderSide(color: AppColor.borderColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.h),
                  borderSide: BorderSide(color: AppColor.borderColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.h),
                  borderSide: BorderSide(color: AppColor.borderColor)),
            ),
          ),
        ],
      ),
    );
  }
}
