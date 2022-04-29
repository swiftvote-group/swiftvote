import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swiftvote/poll_feature/poll_page.dart';
import 'package:swiftvote/swiftvote.dart';

class PollListPage extends StatefulWidget {
  const PollListPage({Key? key}) : super(key: key);

  @override
  State<PollListPage> createState() => _PollListPageState();
}

class _PollListPageState extends State<PollListPage> {
  final polltypes = ["choice", "star", "scale", "pref", "hand"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, i) {
          return PollCard(polltypes[i]);
        });
  }
}

class PollCard extends StatelessWidget {
  final String polltype;
  const PollCard(this.polltype, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PollPreviewPage());
      },
      child: Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: SwiftVote.ssprimaryborder),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Poll on Education",
                    ),
                    const Spacer(),
                    PopupMenuButton(
                        child: Icon(
                          Icons.more_horiz_rounded,
                          color: SwiftVote.textColor,
                        ),
                        padding: EdgeInsets.all(0),
                        itemBuilder: (ctx) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(
                                child: Text(
                              "Share Poll",
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 12,
                              ),
                            )),
                            PopupMenuItem(
                                child: Text(
                              "Delete Poll",
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 12,
                              ),
                            )),
                            PopupMenuItem(
                                child: Text(
                              "Make Poll Private",
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 12,
                              ),
                            )),
                          ];
                        })
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text.rich(TextSpan(children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SvgPicture.asset(
                            "assets/images/poll$polltype.svg",
                            height: 16,
                          )),
                      TextSpan(
                          text: " 2,103",
                          style:
                              TextStyle(fontFamily: 'NotoSans', fontSize: 12))
                    ])),
                    const Spacer(),
                    Text(
                      "5 days left",
                      style: TextStyle(fontFamily: 'NotoSans', fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
