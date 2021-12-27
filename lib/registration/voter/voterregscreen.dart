import 'package:flutter/material.dart';
import 'package:swiftvote/registration/voter/voter.dart';

class VoterRegScreen extends StatefulWidget {
  final List<TextEditingController> controllers;
  const VoterRegScreen(this.controllers, {Key? key}) : super(key: key);

  @override
  _VoterRegScreenState createState() => _VoterRegScreenState();
}

class _VoterRegScreenState extends State<VoterRegScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 8,
      runSpacing: 32,
      children: [
        Voter.defTextFormField("Surname", w / 2, widget.controllers[0]),
        Voter.defTextFormField("Initials", w / 2, widget.controllers[1]),
        Voter.defTextFormField(
            "School registration number (Reg no.)", w, widget.controllers[2]),
        Voter.defTextFormField("Level", w / 2, widget.controllers[3]),
        Voter.defTextFormField("Department", w / 2, widget.controllers[4]),
        Voter.defTextFormField("Faculty", w, widget.controllers[5]),
        SizedBox(
            width: w,
            child: const Text(
              "Make sure you put the accurate information to avoid disapproval.",
              style: TextStyle(fontSize: 10, fontFamily: 'NotoSans'),
            ))
      ],
    );
  }
}
