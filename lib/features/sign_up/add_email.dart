import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../global_componet/global.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftally/features/sign_up/verifiction.dart';

class AddEmailPhoneScreen extends StatefulWidget {
  const AddEmailPhoneScreen({super.key});

  @override
  State<AddEmailPhoneScreen> createState() => _AddEmailPhoneScreenState();
}

class _AddEmailPhoneScreenState extends State<AddEmailPhoneScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Add your email and phone number",
            style: AppStyle.boldTextStyle(),
          ),
          SizedBox(height: 15.h),
          AuthForm(
            controller: emailController,
            hint: "Email address",
          ),
          SizedBox(height: 15.h),
          AuthForm(
            keyboardType: TextInputType.phone,
            controller: phoneController,
            hint: "Phone number",
            isPhone: true,
          ),
          SizedBox(height: 15.h),
          Text(
            "A verification code will be sent to your email or phone.",
            style: AppStyle.mediumTextStyle(),
          ),
          SizedBox(height: 25.h),
          AppButton(
              onPressed: () {
                Get.to(() => const VerivicationScreen());
              },
              value: "Next"),
        ]),
      ),
    );
  }
}
