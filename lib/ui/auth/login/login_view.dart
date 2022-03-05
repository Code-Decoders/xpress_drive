import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/ui/auth/login/login_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/textfields/textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontFamily: 'Gilroy-Bold',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: CustomField(
                        label: 'Username',
                        hint: 'Enter Username',
                        validator: (val) {
                          if (val?.isEmpty ?? true) {
                            return 'Please enter username';
                          } else if ((val?.length ?? 0) < 5) {
                            return 'Username must be atleast 5 characters';
                          }
                        },
                        value: model.username,
                        onChanged: model.setUsername,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: CustomField(
                        label: 'Private Key',
                        hint: 'Enter Private Key',
                        value: model.password,
                        onChanged: model.setPassword,
                        validator: (val) {
                          if (val?.isEmpty ?? true) {
                            return 'Please enter private key';
                          } else if ((val?.length ?? 0) < 32) {
                            return 'Private key must be atleast 32 characters';
                          }
                        },
                        obscureText: true,
                      ),
                    ),
                    Expanded(child: SizedBox.shrink()),
                    Material(
                      color: model.isDiabled
                          ? AppColor.borderColor
                          : AppColor.primaryDark,
                      child: InkWell(
                        onTap: model.login,
                        child: Container(
                          width: double.infinity,
                          height: 60.h,
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
