import 'package:flutter/material.dart';
import 'package:swiftvote/chart/line/mline.dart';
import 'package:swiftvote/home_admin/adminhomeheader.dart';
import 'package:swiftvote/home_admin/profile/adminprofileheader.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminVoteActivity extends StatefulWidget {
  final CandData? cd;
  const AdminVoteActivity({this.cd, Key? key}) : super(key: key);

  @override
  _AdminVoteActivityState createState() => _AdminVoteActivityState();
}

class _AdminVoteActivityState extends State<AdminVoteActivity> {
  int curPos = 0;
  List<String> voteHeaders = ["S/N", "Name", "Dept", "Time"];
  List<String> voteChildren = [
    "0",
    "Francisca John",
    "Electronic Engineering",
    "9:07"
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            AdminHomeHeader(
              cd: widget.cd,
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: MLine(),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: List.generate(
            //         8,
            //         (index) => Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: SwiftVote.livePollUser(),
            //             )),
            //   ),
            // ),
            SwiftVote.adminPageText("Vote Activity"),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Table(
                    border: const TableBorder(
                      top: BorderSide(color: Color(0xFFDADADA)),
                      left: BorderSide(color: Color(0xFFDADADA)),
                      right: BorderSide(color: Color(0xFFDADADA)),
                      bottom: BorderSide(color: Color(0xFFDADADA)),
                      horizontalInside:
                          BorderSide(color: Color(0xFFDADADA), width: 2),
                      verticalInside:
                          BorderSide(color: Color(0xFFDADADA), width: 2),
                    ),
                    defaultColumnWidth: FixedColumnWidth(0.33 * w),
                    columnWidths: const {0: FixedColumnWidth(32)},
                    children: [
                      TableRow(
                          children: List.generate(
                              voteHeaders.length,
                              (j) => Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      voteHeaders[j],
                                      style: const TextStyle(
                                          fontFamily: 'NotoSans',
                                          fontSize: 12,
                                          color: Color(0xFF003478),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                      ...List.generate(
                          50,
                          (i) => TableRow(
                              children: List.generate(
                                  voteHeaders.length,
                                  (j) => Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          j == 0 ? "${i + 1}" : voteChildren[j],
                                          style: const TextStyle(
                                              fontFamily: 'NotoSans',
                                              fontSize: 12),
                                        ),
                                      ))))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
