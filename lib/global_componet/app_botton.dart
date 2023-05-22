import '../constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String value;
  final Color color;
  final Color textcolor;
  const AppButton({
    required this.onPressed,
    required this.value,
    this.color = AppColors.blueColor,
    this.textcolor = AppColors.witheColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Center(
          child: Text(
            value,
            style: AppStyle.extraBoldTextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
