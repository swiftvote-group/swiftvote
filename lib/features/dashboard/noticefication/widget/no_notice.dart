import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoNoticfication extends StatelessWidget {
  const NoNoticfication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(height: 50.h),
        Image.asset(AppImages.noticeImage),
        SizedBox(height: 30.h),
        Text(
          "You’ve no notification",
          style: AppStyle.extraBoldTextStyle(fontSize: 20),
        ),
        SizedBox(height: 20.h),
        Text(
          "Your notifications and alerts will appear here.",
          style: AppStyle.mediumTextStyle(),
        )
      ]),
    );
  }
}
