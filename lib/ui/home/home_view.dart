import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/ui/home/home_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';
import 'package:xpress_drive/ui/widget/icons/icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 812),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.landscape);
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 27.h),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Xpress Drive',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary,
                          ),
                        ),
                        Material(
                            color: Colors.transparent,
                            shape: const CircleBorder(),
                            child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.h),
                                  child: AppIcon(AppIcons.menu,
                                      size: 19.h, color: AppColor.primary),
                                ))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
