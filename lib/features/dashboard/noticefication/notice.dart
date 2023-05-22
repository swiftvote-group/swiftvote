import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/features/dashboard/noticefication/widget/no_notice.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(AppImages.removeicon, scale: 1),
            )),
        title: Text("Notifications",
            style: AppStyle.extraBoldTextStyle(fontSize: 18)),
      ),
      body: const NoNoticfication(),
    );
  }
}
