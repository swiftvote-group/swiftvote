import 'dart:async';
import 'package:get/get.dart';
import 'widget/on_boading_list.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/app_bar.dart';
import 'package:swiftally/features/sign_up/sign_up.dart';
import 'package:swiftally/global_componet/app_botton.dart';
import 'package:swiftally/features/login/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftally/features/onboading/widget/on_boading_card.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboadingScreenState();
}

int i = 0;

class _OnboadingScreenState extends State<OnboadingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (i < 2) {
        i++;
      } else {
        i = 0;
      }
      _pageController.animateToPage(i,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut);
    });
    super.initState();
  }

  cancel() {
    if (_timer!.isActive) {
      _timer!.cancel();
    }
  }

  @override
  void dispose() {
    cancel();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 450,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      i = value;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return OnboadingCard(
                      seleleted: i,
                      title: onboadingtitle[index],
                      image: onboadingImages[index],
                      isSelected: true,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              AppButton(
                onPressed: (){},
                value: "Join an election",
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUp());
                    },
                    child: Text(
                      "Sign up",
                      style: AppStyle.extraBoldTextStyle(fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                       Get.to(() => const LoginScreen());
                    },
                    child: Text(
                      "Log in",
                      style: AppStyle.extraBoldTextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

