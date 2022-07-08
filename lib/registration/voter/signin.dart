import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftvote/home/explorepage.dart';
import 'package:swiftvote/poll_feature/poll_home.dart';
import 'package:swiftvote/registration/voter/recording.dart';
import 'package:swiftvote/registration/voter/user/signup.dart';
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
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSignIn ? buildSignUser() : buildFpass(),
              const Spacer(),
              SwiftVote.defButton(context, null, "Enter",
                  isWide: true, shdStay: true, func: () {
                bool isVal = SWValidator.validList(
                    isSignIn ? _controllers : [_controllers[0]]);
                if (isVal) {
                  if (isSignIn) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            widget.electionURL != null
                                ? RecordingPage()
                                : ExplorePage(),
                      ),
                    );
                  } else {
                    setState(() {
                      isSignIn = true;
                    });
                  }
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

  buildSignUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwiftVote.regHeader(
          "Sign in with your unique ID",
          widget.electionURL == null
              ? "Access the platform with your ID"
              : "You're signing into an election automatically",
        ),
        SwiftVote.defTextFormField("ID", Get.width, _controllers[0]),
        const SizedBox(
          height: 32,
        ),
        SwiftVote.defTextFormField("Password", Get.width, _controllers[1],
            varl: SWV.password),
        const SizedBox(
          height: 32,
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                isSignIn = false;
              });
            },
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
                  builder: (BuildContext context) => SignUpPage(),
                ),
              );
            },
            child: Text("I don't have an ID yet",
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'NotoSans',
                    color: SwiftVote.primaryColor))),
      ],
    );
  }

  buildFpass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwiftVote.regHeader(
          "Remind us the email address",
          "Add email address",
        ),
        SwiftVote.defTextFormField("Email Address", Get.width, _controllers[0],
            varl: SWV.email),
        const SizedBox(
          height: 32,
        ),
        Text("A code will be sent to confirm your email.",
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'NotoSans',
                color: SwiftVote.primaryColor)),
      ],
    );
  }
}
