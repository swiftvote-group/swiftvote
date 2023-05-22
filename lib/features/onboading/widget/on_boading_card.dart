import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';

class OnboadingCard extends StatelessWidget {
  final String title;
  final Widget image;
  final bool isSelected;
  final int seleleted;
  const OnboadingCard({
    Key? key,
    required this.title,
    required this.image,
    required this.isSelected,
    required this.seleleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Text(
          title,
          style: AppStyle.boldTextStyle(),
        ),
        const SizedBox(
          height: 70,
        ),
        image,
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: seleleted == index
                          ? AppColors.blueColor
                          : AppColors.fblueColor,
                      shape: BoxShape.circle,
                    ),
                  )),
        )
      ]),
    );
  }
}
