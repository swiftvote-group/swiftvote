import 'package:flutter/material.dart';
import 'package:swiftvote/registration/voter/voter.dart';
import 'package:swiftvote/swiftvote.dart';

class VoterVerifScreen extends StatefulWidget {
  final List<TextEditingController> controllers;
  const VoterVerifScreen(this.controllers, {Key? key}) : super(key: key);

  @override
  _VoterVerifScreenState createState() => _VoterVerifScreenState();
}

class _VoterVerifScreenState extends State<VoterVerifScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                Voter.defNumberField(context, widget.controllers[0]),
                const Icon(
                  Icons.remove,
                ),
                Voter.defNumberField(context, widget.controllers[1]),
                const Icon(Icons.remove),
                Voter.defNumberField(context, widget.controllers[2]),
                const Icon(Icons.remove),
                Voter.defNumberField(context, widget.controllers[3]),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Verification Code",
              style: TextStyle(color: SwiftVote.textColor),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text.rich(TextSpan(
                text:
                    "This code will automatically expire at the countdown of ",
                style: TextStyle(
                    fontSize: 10,
                    color: SwiftVote.textColor,
                    fontFamily: 'NotoSans'),
                children: [
                  TextSpan(
                    text: "14:58",
                    style: TextStyle(color: Colors.red),
                  )
                ])),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Resend ?",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'NotoSans',
                  color: SwiftVote.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
