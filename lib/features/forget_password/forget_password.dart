import 'package:get/get.dart';
import 'change_password.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/app_botton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftally/global_componet/auth_form_field.dart';
import 'package:swiftally/features/forget_password/forget_verification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.blackColor,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text("Forgotten Password", style: AppStyle.boldTextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Remind us your email address",
              style: AppStyle.boldTextStyle(),
            ),
            SizedBox(height: 20.h),
            AuthForm(controller: emailcontroller, hint: "Email address"),
            SizedBox(height: 100.h),
            AppButton(
                onPressed: () {
                  Get.to(() => const ForgetVerificationScreen());
                },
                value: "Next"),
          ],
        ),
      ),
    );
  }
}
