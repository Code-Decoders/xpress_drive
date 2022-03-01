import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:xpress_drive/ui/auth/landing/landing_viewmodel.dart';
import 'package:xpress_drive/ui/widget/color.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

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
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/background.png',
                width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 80.h),
                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                        height: 173.h,
                      ),
                      SizedBox(height: 20.h),
                      Text('Welcome to',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColor.primary,
                            fontWeight: FontWeight.w300,
                          )),
                      Text(
                        'Xpress Drive',
                        style: TextStyle(
                          fontSize: 38.sp,
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Figma Flutter Generator BestcloudstorageplatformforallbusinessandindividualstomanagetheredatajoinforfreeWidget - TEXT
                      Text(
                        '''Best cloud storage platform for all business and individuals to manage there data 

Join For Free.''',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColor.subtitle,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.h),
                                color: AppColor.primaryDark.withOpacity(.1),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
