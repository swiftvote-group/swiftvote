import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/registration/admin/candidatebulkreg.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminLinkSentPage extends StatelessWidget {
  const AdminLinkSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SwiftVote.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                "assets/images/markgood.svg",
                height: MediaQuery.of(context).size.height / 5,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Link Sent!",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text.rich(TextSpan(
                  text:
                      "Other admins will join you once they follow link and process.",
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontSize: 11,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                        text: " Read our policy and pricing.",
                        style: TextStyle(color: Color(0xFFFFC727))),
                  ])),
              const Spacer(),
              SwiftVote.defButton(context, const CandBulkRegPage(), "Continue",
                  isWide: true, bcolor: Colors.white),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ));
  }
}
