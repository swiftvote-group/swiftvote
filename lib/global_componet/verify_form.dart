import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';

class VerifyForm extends StatelessWidget {
  final TextEditingController controller;
  const VerifyForm({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else {
              if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            }
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.blueColor,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.blueColor,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.blueColor,
                  )),
              hintText: "0",
              hintStyle: AppStyle.mediumTextStyle()),
        ),
      ),
    );
  }
}
