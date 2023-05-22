import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/global.dart';
import 'package:swiftally/global_componet/verify_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftally/features/forget_password/change_password.dart';

class ForgetVerificationScreen extends StatefulWidget {
  const ForgetVerificationScreen({super.key});

  @override
  State<ForgetVerificationScreen> createState() =>
      _ForgetVerificationScreenState();
}

class _ForgetVerificationScreenState extends State<ForgetVerificationScreen> {
  final picController1 = TextEditingController();
  final picController2 = TextEditingController();
  final picController3 = TextEditingController();
  final picController4 = TextEditingController();
  final picController5 = TextEditingController();
  final picController6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.verifyImage),
                  Text(
                    "Verify your email address",
                    style: AppStyle.boldTextStyle(),
                  ),
                  Text(
                    "Do confirm the 6 digits sent to your email, let’s roll.",
                    style: AppStyle.mediumTextStyle(),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VerifyForm(controller: picController1),
                      VerifyForm(controller: picController2),
                      VerifyForm(controller: picController3),
                      VerifyForm(controller: picController4),
                      VerifyForm(controller: picController5),
                      VerifyForm(controller: picController6)
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Resend code",
                        style: AppStyle.extraBoldTextStyle(
                            color: AppColors.blueColor),
                      ),
                      Text(
                        "Change email",
                        style: AppStyle.extraBoldTextStyle(
                            color: AppColors.blueColor),
                      )
                    ],
                  ),
                  SizedBox(height: 60.h),
                  AppButton(
                      onPressed: () {
                        Get.to(() => const ChangePassword());
                      },
                      value: "Verify email")
                ]),
          ),
        ),
      ),
    );
  }
}
