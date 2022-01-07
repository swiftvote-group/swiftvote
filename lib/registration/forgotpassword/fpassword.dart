import 'package:flutter/material.dart';
import 'package:swiftvote/registration/admin/adminreg.dart';
import 'package:swiftvote/registration/forgotpassword/fpthird.dart';
import 'package:swiftvote/swiftvote.dart';

import 'fpfirst.dart';

class FPasswordPage extends StatefulWidget {
  const FPasswordPage({Key? key}) : super(key: key);

  @override
  _FPasswordPageState createState() => _FPasswordPageState();
}

class _FPasswordPageState extends State<FPasswordPage> {
  int _curScreen = 0;
  List<TextEditingController> controllers = [];
  List<Widget> screens = [];
  List<String> btnText = ["Send Code", "Confirm", "Confirm"];

  @override
  void initState() {
    controllers = List.generate(7, (index) => TextEditingController());
    screens = [
      FPFirstScreen(controllers[0]),
      VerificationScreen(controllers.sublist(1, 5)),
      FPThirdScreen(controllers.sublist(5)),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SwiftVote.defAppBar(
        "Forgot Password",
      ),
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
                        if (_curScreen == 2) {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const AdminRegPage(),
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
