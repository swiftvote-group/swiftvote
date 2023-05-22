import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/global.dart';
import 'package:swiftally/features/sign_up/sign_up.dart';
import 'package:swiftally/features/sign_up/add_email.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftally/features/dashboard/dashboard.dart';
import 'package:swiftally/features/forget_password/forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailorIDcontroller = TextEditingController();
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Log into your account", style: AppStyle.boldTextStyle()),
          SizedBox(
            height: 15.h,
          ),
          AuthForm(
              controller: emailorIDcontroller,
              hint: "Email address or Voter ID"),
          SizedBox(height: 15.h),
          AuthForm(
              isPasword: true,
              controller: passwordcontroller,
              hint: "Password"),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const ForgetPassword());
            },
            child: Text(
              "Forgotten password?",
              style: AppStyle.mediumTextStyle(
                color: AppColors.blueColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 15.h,
          ),
          AppButton(
            onPressed: () {
              Get.to(() => const Dashboard());
            },
            value: "Log in",
          ),
          SizedBox(
            height: 10.h,
          ),
          AppButton(
            onPressed: () {
              Get.to(() => const SignUp());
            },
            value: "Create an account",
            color: AppColors.yellowColor,
            textcolor: AppColors.blackColor,
          ),
        ]),
      ),
    );
  }
}
