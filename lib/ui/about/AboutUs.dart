import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/color.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        centerTitle: true,
        title: Text("About us"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Developed by',
              style: TextStyle(
                fontFamily: 'Gilroy-Medium',
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://res.cloudinary.com/practicaldev/image/fetch/s--Tp31RV5X--/c_fill,f_auto,fl_progressive,h_320,q_auto,w_320/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/2799/47f610f4-e699-4d60-b3d5-7f5eabe3758f.jpg",
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'CodeDecoders',
              style: TextStyle(
                fontFamily: 'Gilroy-Medium',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
