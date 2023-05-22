import 'dart:math';
import 'package:flutter/material.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularStepProgressIndicator(
        totalSteps: 20,
        currentStep: 12,
        stepSize: 20,
        selectedColor: Colors.red,
        unselectedColor: Colors.purple[400],
        padding: pi / 80,
        width: 150,
        height: 150,
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Loader(),
          Text(
            "Loading!",
            style: AppStyle.boldTextStyle(),
          ),
        ],
      )),
    );
  }
}
