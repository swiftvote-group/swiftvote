import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminSignupScreen extends StatefulWidget {
  final List<TextEditingController> controllers;
  const AdminSignupScreen(this.controllers, {Key? key}) : super(key: key);

  @override
  _AdminSignupScreenState createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State<AdminSignupScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 32,
          children: [
            SwiftVote.dropdownField("Name of school", w),
            SwiftVote.defTextFormField("Surname", w / 2, widget.controllers[0]),
            SwiftVote.defTextFormField(
                "Initials", w / 2, widget.controllers[1]),
            SwiftVote.defTextFormField("Phone Number", w, widget.controllers[2],
                varl: SWV.phone),
            SwiftVote.defTextFormField(
                "School Role", w / 2, widget.controllers[3]),
            SwiftVote.defTextFormField(
                "School ID Number", w / 2, widget.controllers[4]),
            SwiftVote.defTextFormField(
                "School Email Address", w, widget.controllers[5],
                varl: SWV.phone),
            SwiftVote.dropdownField("Number of admins", w / 2),
            SwiftVote.dropdownField("Type of election", w / 2),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text.rich(TextSpan(
            text: "One person is not allowed to host an election.",
            style: TextStyle(
                fontSize: 10, fontFamily: 'NotoSans', color: Colors.red),
            children: [
              TextSpan(
                text:
                    " Electoral admins must be in a team (not less than 5 members) that control the election activities. If you proceed to host this election, you’ll provide the names and emails of fellow admins and a link will be sent to them for approval.",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'NotoSans',
                    color: SwiftVote.textColor),
              )
            ])),
      ],
    );
  }
}
