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
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Voter.defTextFormField(
              "School Email Address", w, widget.controllers[0]),
          const SizedBox(
            height: 32,
          ),
          Voter.defTextFormField("Phone Number", w, widget.controllers[1]),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "A code will be sent to this email address and phone number.",
            style: TextStyle(fontSize: 10, fontFamily: 'NotoSans'),
          )
        ],
      ),
    );
  }
}
