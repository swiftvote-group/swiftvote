import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';

AppBar appBar() {
  return AppBar(
      leading: Container(),
      leadingWidth: 1,
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      centerTitle: false,
      title: Image.asset(
        AppImages.appLogo,
        height: 30,
        width: 95,
      ));
}
