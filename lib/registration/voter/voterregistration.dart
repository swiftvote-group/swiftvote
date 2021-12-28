import 'package:flutter/material.dart';
import 'package:swiftvote/registration/voter/recording.dart';
import 'package:swiftvote/registration/voter/voternextscreen.dart';
import 'package:swiftvote/registration/voter/voterregscreen.dart';
import 'package:swiftvote/registration/voter/voteruploadscreen.dart';
import 'package:swiftvote/registration/voter/voterverifscreen.dart';
import 'package:swiftvote/swiftvote.dart';

class VoterRegistrationPage extends StatefulWidget {
  const VoterRegistrationPage({Key? key}) : super(key: key);

  @override
  _VoterRegistrationPageState createState() => _VoterRegistrationPageState();
}

class _VoterRegistrationPageState extends State<VoterRegistrationPage> {
  int _curScreen = 0;
  List<TextEditingController> controllers = [];
  List<Widget> screens = [];
  List<String> btnText = ["Next", "Send Code", "Confirm", "Confirm"];

  @override
  void initState() {
    controllers = List.generate(12, (index) => TextEditingController());
    screens = [
      VoterRegScreen(controllers.sublist(0, 6)),
      VoterNextScreen(controllers.sublist(6, 8)),
      VoterVerifScreen(controllers.sublist(8)),
      const VoterUploadScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SwiftVote.defAppBar("Voter"),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: screens[_curScreen]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_curScreen == 3) {
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
                    },
                    child: Text(
                      btnText[_curScreen],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          SwiftVote.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
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
    );
  }
}
