import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftally/features/onboading/onboading.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.backgroundColor,
                elevation: 0,
                centerTitle: false,
                foregroundColor: AppColors.blackColor,
              )),
          debugShowCheckedModeBanner: false,
          color: AppColors.blueColor,
          home: const OnboadingScreen(),
        );
      },
    );
  }
}
