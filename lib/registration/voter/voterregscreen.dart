import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SwiftVote.uniHeader(),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 32,
          children: [
            SwiftVote.defTextFormField("Surname", w / 2, widget.controllers[0]),
            SwiftVote.defTextFormField(
                "Initials", w / 2, widget.controllers[1]),
            SwiftVote.defTextFormField("School registration number (Reg no.)",
                w, widget.controllers[2]),
            SwiftVote.defTextFormField("Level", w / 2, widget.controllers[3]),
            SwiftVote.defTextFormField(
                "Department", w / 2, widget.controllers[4]),
            SwiftVote.defTextFormField("Faculty", w, widget.controllers[5]),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Make sure you put the accurate information to avoid disapproval.",
          style: TextStyle(fontSize: 10, fontFamily: 'NotoSans'),
        )
      ],
    );
  }
}
