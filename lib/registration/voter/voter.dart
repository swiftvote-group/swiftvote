import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

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
              borderSide: const BorderSide(color: Color(0xFF7D848D)),
              borderRadius: BorderRadius.circular(8),
            ),
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, fontFamily: 'NotoSans')),
      ),
    );
  }

  static Widget defNumberField(
      BuildContext context, TextEditingController _controller,
      {bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: _controller,
        maxLength: 1,
        style: const TextStyle(
            fontSize: 20, fontFamily: 'NotoSans', color: SwiftVote.textColor),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          if (value.length == 1) {
            isLast
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
          counterText: '',
          constraints: BoxConstraints(
              minWidth: 32, minHeight: 32, maxWidth: 48, maxHeight: 48),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF7D848D)),
          ),
        ),
      ),
    );
  }

  static Widget uniHeader() {
    return const ListTile(
      leading: CircleAvatar(
        radius: 28,
        child: FlutterLogo(),
      ),
      title: Text("University of Nigeria,Nsukka"),
      subtitle: Text(
        "General Electoral Vote",
        style: TextStyle(
            fontFamily: 'NotoSans', color: SwiftVote.textColor, fontSize: 13),
      ),
    );
  }
}
