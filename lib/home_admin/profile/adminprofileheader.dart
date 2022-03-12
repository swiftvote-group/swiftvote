import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminHeaderPage extends StatelessWidget {
  final String adminImgUrl,
      adminName,
      electionName,
      electionType,
      electionUrl,
      electionPassword;
  const AdminHeaderPage(
      {this.adminImgUrl = "",
      this.adminName = "Jonathan Obi",
      this.electionName = "UNN General Electoral Vote",
      this.electionPassword = "ab12rv43-rt&p",
      this.electionType = "General Elections",
      this.electionUrl = "geunn//1yl-27b7-4/T/.swift",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = (MediaQuery.of(context).size.height / 4) - 56;
    return Container(
      height: h,
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: SwiftVote.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/defpic.svg",
            height: h - 32,
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    electionName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    electionType,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    adminName,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSans',
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xFF225EAD),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(
                                text: "URL: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text: electionUrl,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ])),
                            SizedBox(
                              height: 4,
                            ),
                            Text.rich(TextSpan(
                                text: "Password: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSans',
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text: electionPassword,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]))
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              Share.share(
                                  "URL : $electionUrl \n Password : $electionPassword");
                            },
                            icon:
                                Icon(Icons.share_rounded, color: Colors.white)),
                      )
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
