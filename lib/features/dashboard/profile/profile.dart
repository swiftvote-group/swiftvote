import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/global_componet/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftally/features/dashboard/noticefication/notice.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 1,
        leading: Container(),
        title: Text("Welcome Judith!", style: AppStyle.boldTextStyle()),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const NotificationScreen());
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.notifications_none,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.fblueColor,
                    borderRadius: BorderRadius.circular(6)),
                height: 160.h,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_box_outlined, size: 27),
                      SizedBox(height: 20.h),
                      Text(
                        "Create your virtual voter ID",
                        style: AppStyle.mediumTextStyle(),
                      )
                    ]),
              ),
              SizedBox(height: 20.h),
              Text(
                "My recent activities",
                style: AppStyle.extraBoldTextStyle(),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.fblueColor,
                    borderRadius: BorderRadius.circular(6)),
                height: 130.h,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "No activity yet",
                        style: AppStyle.boldTextStyle(),
                      )
                    ]),
              ),
              SizedBox(height: 20.h),
              Text(
                "Profile roles",
                style: AppStyle.extraBoldTextStyle(),
              ),
              SizedBox(height: 10.h),
              ExpansionTile(
                title: Text(
                  "Voter",
                  style: AppStyle.mediumTextStyle(fontSize: 16),
                ),
                children: [
                  AppButton(
                      onPressed: () {}, value: "Create a virtual voter ID")
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Admin",
                  style: AppStyle.mediumTextStyle(fontSize: 16),
                ),
                children: [AppButton(onPressed: () {}, value: "Admin")],
              ),
              ExpansionTile(
                title: Text(
                  "Candidate",
                  style: AppStyle.mediumTextStyle(fontSize: 16),
                ),
                children: [AppButton(onPressed: () {}, value: "Candidate")],
              )
            ],
          ),
        ),
      ),
    );
  }
}
