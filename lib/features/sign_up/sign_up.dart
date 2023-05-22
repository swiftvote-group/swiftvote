import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/global.dart';
import 'package:swiftally/features/sign_up/add_email.dart';
import 'package:swiftally/features/login/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController confirmPasswordcontroller =
      TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController fullnamecontroller = TextEditingController();
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Sign up", style: AppStyle.boldTextStyle()),
          SizedBox(
            height: 15.h,
          ),
          AuthForm(controller: fullnamecontroller, hint: "Full name"),
          SizedBox(
            height: 10.h,
          ),
          AuthForm(
              isPasword: true,
              controller: passwordcontroller,
              hint: "Password"),
          SizedBox(
            height: 10.h,
          ),
          AuthForm(
            isPasword: true,
            controller: confirmPasswordcontroller,
            hint: "Confirm Password",
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Checkbox(
                  value: checkValue,
                  onChanged: (v) {
                    setState(() {
                      checkValue = v!;
                    });
                  }),
              const Expanded(
                child: Text(
                    "By signing up, I agree to Swiftvote Terms and Conditions and Privacy Policy."),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          AppButton(
            onPressed: () {
              Get.to(() => const AddEmailPhoneScreen());
            },
            value: "Sign up",
          ),
          SizedBox(
            height: 10.h,
          ),
          AppButton(
            onPressed: () {
               Get.to(() => const LoginScreen());
            },
            value: "Log into your account",
            color: AppColors.yellowColor,
            textcolor: AppColors.blackColor,
          ),
        ]),
      ),
    );
  }
}
