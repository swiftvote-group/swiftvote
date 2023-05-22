import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:swiftally/features/dashboard/profile/profile.dart';
// ignore_for_file: deprecated_member_use

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

List pages = [
  const Profile(),
  Center(
    child: Text(
      'Poll',
      style: AppStyle.extraBoldTextStyle(),
    ),
  ),
  Center(
    child: Text(
      'SwiftED',
      style: AppStyle.extraBoldTextStyle(),
    ),
  ),
  Center(
    child: Text(
      'Setting',
      style: AppStyle.extraBoldTextStyle(),
    ),
  )
];
int i = 0;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.blueColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.svgUserIcon,
                color: i == 0 ? AppColors.blueColor : AppColors.blackColor,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.svgPollIcon,
                color: i == 1 ? AppColors.blueColor : AppColors.blackColor,
              ),
              label: "Poll"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.svgSwifted,
                color: i == 2 ? AppColors.blueColor : AppColors.blackColor,
              ),
              label: "SwiftED"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Setting"),
        ],
        currentIndex: i,
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
      ),
    );
  }
}
