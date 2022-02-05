import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/registration/voter/loading.dart';
import 'package:swiftvote/swiftvote.dart';

class VoteLinkPage extends StatefulWidget {
  const VoteLinkPage({Key? key}) : super(key: key);

  @override
  _VoteLinkPageState createState() => _VoteLinkPageState();
}

class _VoteLinkPageState extends State<VoteLinkPage> {
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
                SwiftVote.signinField(
                    Icons.link_outlined, "geunn//1yl-27b7-4/T/.swift", w),
                const SizedBox(
                  height: 8,
                ),
                SwiftVote.signinField(Icons.vpn_key_outlined, "Password", w),
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
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text.rich(TextSpan(children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(Icons.warning_amber_rounded,
                              color: SwiftVote.textColor)),
                      TextSpan(
                          text: "  Report Issue",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSans',
                            color: SwiftVote.textColor,
                            fontSize: 16,
                          ))
                    ])),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side:
                                  const BorderSide(color: SwiftVote.textColor),
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24)),
                    ),
                  ),
                ),
                const Spacer(),
                SwiftVote.defButton(context, const LoadingPage(), "Enter"),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
