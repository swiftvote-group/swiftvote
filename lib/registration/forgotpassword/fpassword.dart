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
  final formkey = GlobalKey<FormState>();
  final verifkey = GlobalKey<VerificationScreenState>();

  @override
  void initState() {
    controllers = List.generate(7, (index) => TextEditingController());
    screens = [
      FPFirstScreen(controllers[0]),
      VerificationScreen(
        controllers.sublist(1, 5),
        key: verifkey,
      ),
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
            height: MediaQuery.of(context).size.height - 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Expanded(child: screens[_curScreen]),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 64),
                      child: TextButton(
                        onPressed: () {
                          if (_curScreen == 1) {
                            if (!SWValidator.validList(
                                controllers.sublist(1, 5))) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SwiftVote.errorBar(
                                      "Invalid Verification Code"));
                              return;
                            } else if (verifkey.currentState!.currentSeconds >=
                                900) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SwiftVote.errorBar(
                                      "Expired Verification Code, Please Try Again"));
                              return;
                            }
                          } else if (_curScreen == 2) {
                            if (controllers[5].value.text !=
                                controllers[6].value.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SwiftVote.errorBar("Password Must Match"));
                              return;
                            }
                          }
                          final form = formkey.currentState;
                          if (form!.validate()) {
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}
