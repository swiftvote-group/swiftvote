import 'package:flutter/material.dart';
import 'package:swiftvote/registration/voter/voter.dart';
import 'package:swiftvote/swiftvote.dart';

class FPFirstScreen extends StatefulWidget {
  final TextEditingController controller;
  const FPFirstScreen(this.controller, {Key? key}) : super(key: key);

  @override
  _FPFirstScreenState createState() => _FPFirstScreenState();
}

class _FPFirstScreenState extends State<FPFirstScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: SwiftVote.defTextFormField("Email Address", w, widget.controller,
          varl: SWV.email),
    );
  }
}
