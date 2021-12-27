import 'package:flutter/material.dart';
import 'package:swiftvote/registration/admin/adminlinksent.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminShareLinkPage extends StatefulWidget {
  const AdminShareLinkPage({Key? key}) : super(key: key);

  @override
  _AdminShareLinkPageState createState() => _AdminShareLinkPageState();
}

class _AdminShareLinkPageState extends State<AdminShareLinkPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: SwiftVote.defAppBar("Admin"),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Who’s on your team?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add other admins",
                      style: TextStyle(
                          color: SwiftVote.textColor,
                          fontFamily: 'NotoSans',
                          fontSize: 10),
                    ),
                  ),
                  Column(
                    children: List.generate(6, (index) => adminField(w)),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w / 1.5,
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: false,
                          onChanged: (n) {},
                          title: const Text(
                            "Automatic sign-up with link",
                            style: TextStyle(
                                fontSize: 10,
                                color: SwiftVote.textColor,
                                fontFamily: 'NotoSans'),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          "I’ll do it later",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                              color: SwiftVote.primaryColor,
                              fontFamily: 'NotoSans'),
                        ),
                      ),
                    ],
                  ),
                  Text.rich(TextSpan(
                      text: "One person is not allowed to host an election.",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: Colors.red,
                          fontSize: 10),
                      children: [
                        TextSpan(
                            text:
                                " Electoral admins must be in a team (not less than 5 members) that control the election activities. If you proceed to host this election, you’ll provide the names and emails of fellow admins and a link will be sent to them for approval.",
                            style: TextStyle(color: SwiftVote.textColor))
                      ])),
                  SwiftVote.defButton(
                      context, const AdminLinkSentPage(), "Share Link")
                ]),
          ),
        )));
  }
}

Widget adminField(double w) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: w,
      child: TextFormField(
        decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: SwiftVote.textColor)),
            suffixIcon: Icon(
              Icons.link,
              color: SwiftVote.textColor,
            ),
            hintText: "Email Address",
            hintStyle: const TextStyle(
                fontSize: 13,
                fontFamily: 'NotoSans',
                color: SwiftVote.textColor)),
      ),
    ),
  );
}
