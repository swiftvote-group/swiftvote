import 'package:flutter/material.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Change your password",
            style: AppStyle.boldTextStyle(),
          ),
          SizedBox(
            height: 20.h,
          ),
          AuthForm(
              controller: passwordController,
              hint: "New password",
              isPasword: true),
          SizedBox(
            height: 15.h,
          ),
          AuthForm(
            controller: confirmPassController,
            hint: "Confirm new password",
            isPasword: true,
          ),
          SizedBox(
            height: 80.h,
          ),
          AppButton(onPressed: () {}, value: "Update"),
        ]),
      ),
    );
  }
}
