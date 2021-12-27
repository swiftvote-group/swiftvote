// This is a static class that contains constants and the likes.

import 'package:flutter/material.dart';

class SwiftVote {
  //General
  static const primaryColor = Color(0XFF003478);
  static const textColor = Color(0xFF22272E);

  //Splashscreen --- ss
  static const ssprogressFill = Color(0XFF407BFF);
  static const ssprogressDefault = Color(0XFFAAC4FF);
  static const sstextColor = Color(0XFF22272E);
  static const ssbuttonColor = Color(0XFFCBDBFF);

  //For other screens put them below here

  //Buttons
  static ButtonStyle defButtonStyle({Color color = primaryColor}) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16))),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 48)),
      //minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(56)),
    );
  }

  //Text
  static TextStyle defTextStyle({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontSize: 15,
    );
  }

  static AppBar defAppBar(String title) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, color: textColor),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
          child: Container(
            color: const Color(0xFF726F6F),
            height: 1.0,
          ),
          preferredSize: const Size.fromHeight(1.0)),
    );
  }

  static TextButton defButton(BuildContext context, Widget? screen, String data,
      {Color bcolor = primaryColor, bool isWide = false}) {
    return TextButton(
      onPressed: screen == null
          ? () {}
          : () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => screen,
                ),
              );
            },
      child: Text(
        data,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size?>(
            isWide ? const Size.fromHeight(24) : null),
        backgroundColor: MaterialStateProperty.all<Color>(bcolor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 48)),
      ),
    );
  }
}
