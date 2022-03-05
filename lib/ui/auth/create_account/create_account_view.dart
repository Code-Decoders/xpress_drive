import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/ui/auth/create_account/create_account_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/textfields/textfield.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
        viewModelBuilder: () => CreateAccountViewModel(),
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
                        'Create Account',
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
                    Expanded(child: SizedBox.shrink()),
                    Material(
                      color: model.isDiabled
                          ? AppColor.borderColor
                          : AppColor.primaryDark,
                      child: InkWell(
                        onTap: model.isDiabled ? null : model.signup,
                        child: Container(
                          width: double.infinity,
                          height: 60.h,
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
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
