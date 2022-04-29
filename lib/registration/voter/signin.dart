import 'package:flutter/material.dart';
import 'package:swiftvote/poll_feature/poll_home.dart';
import 'package:swiftvote/registration/voter/recording.dart';
import 'package:swiftvote/registration/voter/voterregistration.dart';
import 'package:swiftvote/swiftvote.dart';

class SignInPage extends StatefulWidget {
  final String? electionURL, electionPass;
  const SignInPage({Key? key, this.electionURL, this.electionPass})
      : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  final errorBar = SwiftVote.errorBar("Invalid ID and Password");
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Sign in with your unique ID",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                  widget.electionURL == null
                      ? "Access the platform with your ID"
                      : "You're signing into an election automatically",
                  style: TextStyle(fontSize: 12, fontFamily: 'NotoSans')),
              const SizedBox(
                height: 32,
              ),
              SwiftVote.defTextFormField("ID", w, _controllers[0]),
              const SizedBox(
                height: 32,
              ),
              SwiftVote.defTextFormField("Password", w, _controllers[1],
                  varl: SWV.password),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                  child: Text("Forgotten ID , send ID to my email",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NotoSans',
                          color: SwiftVote.primaryColor))),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            VoterRegistrationPage(),
                      ),
                    );
                  },
                  child: Text("I don't have an ID yet",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'NotoSans',
                          color: SwiftVote.primaryColor))),
              const Spacer(),
              SwiftVote.defButton(context, null, "Enter",
                  isWide: true, shdStay: true, func: () {
                bool isVal = SWValidator.validList(_controllers);
                if (isVal) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          widget.electionURL != null
                              ? RecordingPage()
                              : PollHomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(errorBar);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
