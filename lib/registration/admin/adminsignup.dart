import 'package:flutter/material.dart';
import 'package:swiftvote/registration/admin/adminlinksent.dart';
import 'package:swiftvote/registration/admin/adminsharelink.dart';
import 'package:swiftvote/registration/admin/adminsignupscreen.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({Key? key}) : super(key: key);

  @override
  _AdminSignUpState createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  int _curScreen = 0;
  List<TextEditingController> controllers = [];
  List<Widget> screens = [];
  List<String> btnText = ["Next", "Confirm", "Share Link"];

  @override
  void initState() {
    controllers = List.generate(10, (index) => TextEditingController());
    screens = [
      AdminSignupScreen(controllers.sublist(0, 6)),
      VerificationScreen(controllers.sublist(6)),
      const AdminShareLinkPage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SwiftVote.defAppBar("Admin"),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: screens[_curScreen]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_curScreen == 2) {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const AdminLinkSentPage(),
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