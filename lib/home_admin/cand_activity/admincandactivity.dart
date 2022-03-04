import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swiftvote/chart/bar/vbar.dart';
import 'package:swiftvote/chart/line/mline.dart';
import 'package:swiftvote/home_admin/adminhomeheader.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminCandActivity extends StatefulWidget {
  final CandData cd;
  const AdminCandActivity(this.cd, {Key? key}) : super(key: key);

  @override
  _AdminCandActivityState createState() => _AdminCandActivityState();
}

class _AdminCandActivityState extends State<AdminCandActivity> {
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
    List<Candidate> topCand = [];
    topCand.addAll(widget.cd.allCand!);
    topCand.sort((a, b) => b.voteCount.compareTo(a.voteCount));
    List<Widget> charts = [
      VBar(cd: widget.cd),
      VBar(
        cd: widget.cd,
        isVertical: false,
      ),
      MLine(),
    ];
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
            CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (BuildContext ctx, int i, int j) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: charts[i],
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 1.7,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                )),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: VBar(cd: widget.cd),
            // ),
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
            SwiftVote.adminPageText("Top Candidates"),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: topCand.length,
                    itemBuilder: (BuildContext context, int index) {
                      Candidate cdf = topCand[index];
                      return SwiftVote.candListTile(context,
                          name: cdf.candName,
                          percent: cdf.percentVote(widget.cd.totalVote),
                          pcol: cdf.ccol!);
                    })),
          ],
        ),
      ),
    );
  }
}
