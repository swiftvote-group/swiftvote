import 'package:flutter/material.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class VoterRegScreen extends StatefulWidget {
  final FormController fc;
  const VoterRegScreen(this.fc, {Key? key}) : super(key: key);

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
        widget.fc.conts.length < 7
            ? SwiftVote.uniHeader()
            : Align(
                alignment: Alignment.center,
                child: UserPicContainer(widget.fc)),
        const SizedBox(
          height: 32,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 32,
          children: [
            SwiftVote.defTextFormField("Surname", w / 2, widget.fc.conts[0]),
            SwiftVote.defTextFormField("Initials", w / 2, widget.fc.conts[1]),
            if (widget.fc.conts.length > 6)
              SwiftVote.defTextFormField(
                  "Name of Institution", w, widget.fc.conts[6]),
            SwiftVote.defTextFormField(
                "School registration number (Reg no.)", w, widget.fc.conts[2]),
            SwiftVote.defTextFormField("Level", w / 2, widget.fc.conts[3]),
            SwiftVote.defTextFormField("Department", w / 2, widget.fc.conts[4]),
            SwiftVote.defTextFormField("Faculty", w, widget.fc.conts[5]),
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
