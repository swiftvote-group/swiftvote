import 'package:flutter/material.dart';
import 'package:swiftvote/registration/voter/voter.dart';

class VoterNextScreen extends StatefulWidget {
  final List<TextEditingController> controllers;
  const VoterNextScreen(this.controllers, {Key? key}) : super(key: key);

  @override
  _VoterNextScreenState createState() => _VoterNextScreenState();
}

class _VoterNextScreenState extends State<VoterNextScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 8,
      runSpacing: 16,
      children: [
        Voter.defTextFormField("School Email Adress", w, widget.controllers[0]),
        Voter.defTextFormField("Phone Number", w, widget.controllers[1]),
        SizedBox(
            width: w,
            child: const Text(
              "A code will be sent to this email address and phone number.",
              style: TextStyle(fontSize: 10, fontFamily: 'NotoSans'),
            ))
      ],
    );
  }
}
