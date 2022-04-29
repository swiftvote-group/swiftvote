import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/poll_feature/poll_edit.dart';
import 'package:swiftvote/poll_feature/poll_result.dart';
import 'package:swiftvote/swiftvote.dart';

class PollPreviewPage extends StatefulWidget {
  const PollPreviewPage({Key? key}) : super(key: key);

  @override
  State<PollPreviewPage> createState() => _PollPreviewPageState();
}

class _PollPreviewPageState extends State<PollPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: Get.height / 6,
            padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 8),
            color: SwiftVote.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset("assets/images/fulllogow.svg"),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Create polls and elections with this wonderful platform",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'NotoSans'),
                    )),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PollResult(
                    "Poll on Education",
                    "200",
                    "5 days left",
                    "How far the world ?",
                    PollChooserItem(PollType.values[Random().nextInt(5)], [
                      "Option 1",
                      "Option 2",
                    ])),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SwiftVote.defButton(
                  context,
                  PollEditPage(),
                  "Create your own poll",
                ),
                SwiftVote.pcov(
                    IconButton(
                        onPressed: () {
                          Share.share("URL for poll");
                        },
                        icon: Icon(
                          Icons.share_outlined,
                        )),
                    pad: 0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
