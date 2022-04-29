import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/registration/voter/loading.dart';
import 'package:swiftvote/registration/voter/signin.dart';
import 'package:swiftvote/swiftvote.dart';

class VoteLinkPage extends StatefulWidget {
  const VoteLinkPage({Key? key}) : super(key: key);

  @override
  _VoteLinkPageState createState() => _VoteLinkPageState();
}

class _VoteLinkPageState extends State<VoteLinkPage> {
  final errorBar = SwiftVote.errorBar("Invalid ID and Password");
  List<TextEditingController> conts = [
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SwiftVote.defAppBar("Voter"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                SvgPicture.asset("assets/images/voterreg.svg",
                    height: MediaQuery.of(context).size.height / 3),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Enter school vote link to participate",
                      style: TextStyle(fontFamily: 'NotoSans'),
                    ),
                  ),
                ),
                SwiftVote.signinField(Icons.link_outlined,
                    "geunn//1yl-27b7-4/T/.swift", w, conts[0]),
                const SizedBox(
                  height: 8,
                ),
                SwiftVote.signinField(
                    Icons.vpn_key_outlined, "Password", w, conts[1],
                    isPass: true),
                const SizedBox(
                  height: 16,
                ),
                SwiftVote.defButton(context, null, "Sign In With ID",
                    bcolor: Colors.white,
                    isBorder: true,
                    porr: true,
                    isWide: true,
                    shdStay: true, func: () {
                  bool isVal = SWValidator.validList(conts);
                  if (!isVal) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignInPage(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SignInPage(
                            electionURL: conts[0].value.text,
                            electionPass: conts[1].value.text),
                      ),
                    );
                  }
                }),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text("Report Issue",
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: SwiftVote.primaryColor,
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                        )),
                  ),
                ),
                const Spacer(),
                SwiftVote.defButton(context, null, "Enter",
                    isWide: true, shdStay: true, func: () {
                  bool isVal = SWValidator.validList(conts);
                  if (isVal) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoadingPage(),
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
      ),
    );
  }
}
