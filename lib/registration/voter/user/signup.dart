import 'package:flutter/material.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/registration/voter/recording.dart';
import 'package:swiftvote/registration/voter/voternextscreen.dart';
import 'package:swiftvote/registration/voter/voterregscreen.dart';
import 'package:swiftvote/registration/voter/voteruploadscreen.dart';
import 'package:swiftvote/swiftvote.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _curScreen = 0;
  List<TextEditingController> controllers = [];
  List<Widget> screens = [];
  List<String> subtitles = [
    "Add your details to ease further sign-ins",
    "Add phone number and email address",
    "Enter the code sent to your email"
  ];
  List<String> btnText = ["Next", "Confirm", "Confirm"];
  final formkey = GlobalKey<FormState>();
  final verifkey = GlobalKey<VerificationScreenState>();

  @override
  void initState() {
    controllers = List.generate(13, (index) => TextEditingController());
    screens = [
      VoterRegScreen(FormController(controllers.sublist(0, 7), userPic: null)),
      VoterNextScreen(controllers.sublist(7, 9)),
      VerificationScreen(controllers.sublist(9), key: verifkey),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: SwiftVote.defAppBar("Voter"),
      body: WillPopScope(
        onWillPop: () async {
          if (_curScreen > 0) {
            setState(() {
              _curScreen--;
            });
            return false;
          }
          return true;
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formkey,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwiftVote.regHeader(
                          "Register virtual voter ID", subtitles[_curScreen]),
                      Expanded(child: screens[_curScreen]),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextButton(
                          onPressed: () {
                            if (_curScreen == 2) {
                              if (!SWValidator.validList(
                                  controllers.sublist(9))) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SwiftVote.errorBar(
                                        "Invalid Verification Code"));
                                return;
                              } else if (verifkey
                                      .currentState!.currentSeconds >=
                                  900) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SwiftVote.errorBar(
                                        "Expired Verification Code, Please Try Again"));
                                return;
                              }
                            }
                            final form = formkey.currentState!;
                            if (form.validate()) {
                              setState(() {
                                if (_curScreen == 2) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const RecordingPage(),
                                    ),
                                  );
                                } else {
                                  _curScreen++;
                                }
                              });
                            }
                          },
                          child: Text(
                            btnText[_curScreen],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(
                                const Size.fromHeight(24)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                SwiftVote.primaryColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 48)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
