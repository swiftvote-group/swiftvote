import 'package:flutter/material.dart';

class Voter {
  //will be used in the future as a proper model for Voters

  static Widget defTextFormField(
      String hint, double width, TextEditingController _controller) {
    return SizedBox(
      width: width - 32,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7D848D)),
              borderRadius: BorderRadius.circular(8),
            ),
            isDense: true,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 13, fontFamily: 'NotoSans')),
      ),
    );
  }
}
