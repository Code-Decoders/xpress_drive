import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/ui/auth/pass_gen/pass_gen_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';
import 'package:xpress_drive/ui/widget/textfields/textfield.dart';

class PassGenView extends StatelessWidget {
  final String username;
  const PassGenView({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ViewModelBuilder<PassGenViewModel>.reactive(
        viewModelBuilder: () => PassGenViewModel(username),
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
            body: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontFamily: 'Gilroy-Bold',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.h),
                      CustomField(
                        label:
                            'Please note down the below private key somewhere safe. In case the private key gets lost, there is no way to reaccess it.',
                        hint: 'Enter Username',
                        disabled: true,
                        value: model.password,
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Material(
                              borderRadius: BorderRadius.circular(10.h),
                              color: AppColor.primaryDark,
                              child: InkWell(
                                onTap: model.navigateToHome,
                                borderRadius: BorderRadius.circular(10.h),
                                child: Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.h),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Proceed',
                                        style: TextStyle(
                                          fontFamily: 'Gilroy-Medium',
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 10.h),
                                      AppIcon(
                                        AppIcons.arrow_right,
                                        color: Colors.white,
                                        size: 10.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
