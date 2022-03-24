import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

class FPThirdScreen extends StatefulWidget {
  final List<TextEditingController> controllers;
  const FPThirdScreen(this.controllers, {Key? key}) : super(key: key);

  @override
  _FPThirdScreenState createState() => _FPThirdScreenState();
}

class _FPThirdScreenState extends State<FPThirdScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SwiftVote.defTextFormField("New Password", w, widget.controllers[0],
              varl: SWV.password),
          const SizedBox(
            height: 32,
          ),
          SwiftVote.defTextFormField(
              "Confirm Password", w, widget.controllers[1],
              varl: SWV.password),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
