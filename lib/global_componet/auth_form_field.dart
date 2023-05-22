import 'package:flutter/material.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:swiftally/styling/text_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    this.isPasword = false,
    this.isPhone = false,
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType = TextInputType.name,
  });
  final String hint;
  final TextEditingController controller;
  final bool isPasword;
  final bool isPhone;
  final TextInputType keyboardType;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late FlCountryCodePicker countryPicker;
  bool isObusure = true;
  CountryCode? code;

  @override
  void initState() {
    final favoriteCountries = ['NG', "US", 'CA'];
    countryPicker = FlCountryCodePicker(
        favorites: favoriteCountries,
        favoritesIcon: const Icon(
          Icons.favorite,
          color: AppColors.blueColor,
        ));
    super.initState();
  }

  pickCode(BuildContext context) async {
    final c = await countryPicker.showPicker(context: context);
    if (c != null) {
      setState(() {
        code = c;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: Center(
        child: TextFormField(
          keyboardType: widget.keyboardType,
          obscureText: widget.isPasword ? isObusure : false,
          controller: widget.controller,
          decoration: InputDecoration(
              suffixIcon: widget.isPasword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isObusure = !isObusure;
                        });
                      },
                      child: Icon(
                        isObusure ? Icons.visibility : Icons.visibility_off,
                      ))
                  : widget.isPhone
                      ? GestureDetector(
                          onTap: () {
                            pickCode(context);
                          },
                          child: Container(
                            height: 20,
                            width: 55,
                            padding: const EdgeInsets.only(right: 8),
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: AppColors.blueColor))),
                            child: Center(
                              child: Text(
                                code != null ? code!.dialCode : "01",
                                style: AppStyle.mediumTextStyle(),
                              ),
                            ),
                          ),
                        )
                      : null,
              hintText: widget.hint,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              hintStyle: AppStyle.mediumTextStyle(),
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
                  ))),
        ),
      ),
    );
  }
}
