import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/app_botton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifySs extends StatelessWidget {
  final VoidCallback onPressed;
  final String callAction;
  final String discription;
  final String bottonText;
  const VerifySs({
    super.key,
    required this.onPressed,
    required this.callAction,
    required this.discription,
    required this.bottonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blueColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                AppImages.verifyMes,
                height: 80,
              ),
              SizedBox(height: 20.h),
              Text(
              callAction,
                style: AppStyle.extraBoldTextStyle(color: AppColors.witheColor),
              ),
              SizedBox(height: 20.h),
              Text(
                "Perfect! You’re ready to enter your dashboard",
                style: AppStyle.mediumTextStyle(color: AppColors.witheColor),
              ),
              SizedBox(height: 120.h),
              AppButton(
                onPressed: onPressed,
                value: "Go to my dashboard",
                color: AppColors.witheColor,
                textcolor: AppColors.blueColor,
              )
            ],
          )),
        ));
  }
}
