import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/poll_feature/poll_result.dart';
import 'package:swiftvote/swiftvote.dart';

class PollEditPage extends StatefulWidget {
  const PollEditPage({Key? key}) : super(key: key);

  @override
  State<PollEditPage> createState() => _PollEditPageState();
}

class _PollEditPageState extends State<PollEditPage>
    with SingleTickerProviderStateMixin {
  String title = "Edit";
  bool isDraft = true;
  late TabController tcont;
  int curPollType = 0;
  List<Color> pollColors = SwiftVote.defRandColors(j: 5);
  final Map<String, String> polltypelabel = {
    "assets/images/pollchoice.svg": "Choice Vote",
    "assets/images/pollhand.svg": "Raise Hand",
    "assets/images/pollstar.svg": "Rating",
    "assets/images/pollscale.svg": "Scale Vote",
    "assets/images/pollpref.svg": "Preferability",
  };
  List<TextEditingController> pa = [
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> pollOptions = [
    TextEditingController(),
    TextEditingController()
  ];

  @override
  void initState() {
    tcont = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    if (isDraft) {
      //save poll
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SwiftVote.errorBar("Poll is published", isError: false));
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width / 1.5;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: SwiftVote.textColor),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.chevron_left_rounded,
              color: SwiftVote.textColor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                //save
                ScaffoldMessenger.of(context).showSnackBar(
                    SwiftVote.errorBar("Poll is published", isError: false));
                Share.share("URL for poll");
              },
              icon: Icon(
                Icons.send_rounded,
                color: SwiftVote.textColor,
              )),
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert_rounded,
                color: SwiftVote.textColor,
              ),
              itemBuilder: (ctx) {
                return <PopupMenuEntry>[
                  PopupMenuItem(child: Text("Delete Poll")),
                  PopupMenuItem(child: Text("Hide Result")),
                  PopupMenuItem(child: Text("Make Poll Private")),
                ];
              })
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: double.maxFinite,
              height: 8,
            ),
            SwiftVote.pcovtab(
              SizedBox(
                height: 32,
                width: w,
                child: TabBar(
                  tabs: [
                    Tab(
                      text: "Draft",
                    ),
                    Tab(text: "Result"),
                  ],
                  controller: tcont,
                  indicator: BoxDecoration(
                    color: SwiftVote.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: SwiftVote.primaryColor),
                  ),
                  unselectedLabelColor: SwiftVote.primaryColor,
                  labelColor: Colors.white,
                  onTap: (i) {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      isDraft = i == 0;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            isDraft ? polltypeCards() : SizedBox(),
            const SizedBox(
              height: 8,
            ),
            isDraft
                ? PollDraft(PollType.values[curPollType], pa, pollOptions)
                : PollResult(
                    pa[0].value.text,
                    "200",
                    "5 days left",
                    pa[1].value.text,
                    PollChooserItem(PollType.values[curPollType],
                        pollOptions.map((e) => e.value.text).toList()),
                    true),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget polltypeCards() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: List.generate(
          5,
          (index) => GestureDetector(
              onTap: () {
                setState(() {
                  curPollType = index;
                });
              },
              child: pollCard(
                  polltypelabel.values.toList()[index],
                  polltypelabel.keys.toList()[index],
                  curPollType == index,
                  pollColors[index].withOpacity(0.5)))),
    );
  }

  Widget pollCard(String a, String b, bool isSel, Color c) {
    return Container(
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(8),
          border: isSel ? Border.all(color: SwiftVote.primaryColor) : null,
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Text.rich(TextSpan(children: [
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: SvgPicture.asset(
                b,
                height: 16,
              )),
          TextSpan(text: " $a")
        ])));
  }
}

class PollDraft extends StatefulWidget {
  final PollType pt;
  final List<TextEditingController> pa, pollOptions;
  const PollDraft(this.pt, this.pa, this.pollOptions, {Key? key})
      : super(key: key);

  @override
  State<PollDraft> createState() => PollDraftState();
}

class PollDraftState extends State<PollDraft> {
  final Map<PollType, String> polltypelabel = {
    PollType.choice: "*Voters will only choose one choice",
    PollType.hand: "*Voters will raise or lower hands to vote options",
    PollType.star: "*Voters will rank options",
    PollType.scale: "*Voters will choose scale points to vote options",
    PollType.pref:
        "*Voters will choose preferrable suggestions to vote options",
  };

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 8,
      ),
      SwiftVote.defTextFormField("Poll Title", (5 * (w + 32) / 7), widget.pa[0],
          fs: 16),
      const SizedBox(
        height: 16,
      ),
      SwiftVote.defTextFormField("Ask Question...", w, widget.pa[1],
          varl: SWV.multi),
      const SizedBox(
        height: 16,
      ),
      Text(
        "Question Bank",
        style: TextStyle(color: SwiftVote.primaryColor),
      ),
      const SizedBox(
        height: 16,
      ),
      ...List.generate(
          widget.pollOptions.length,
          (index) => DefPollEdit(
              index + 1,
              widget.pollOptions[index],
              index == widget.pollOptions.length - 1,
              widget.pt,
              refreshPage,
              refreshPageR)),
      const SizedBox(
        height: 8,
      ),
      Text(polltypelabel[widget.pt]!),
    ]);
  }

  void refreshPage() {
    setState(() {
      widget.pollOptions.add(TextEditingController());
    });
  }

  void refreshPageR() {
    setState(() {
      if (widget.pollOptions.length > 2) {
        widget.pollOptions.removeLast();
      }
    });
  }
}

class DefPollEdit extends StatefulWidget {
  final bool isLast;
  final Function() notifyParent;
  final Function() notifyParentR;
  final TextEditingController cont;
  final PollType pt;
  final int i;
  const DefPollEdit(this.i, this.cont, this.isLast, this.pt, this.notifyParent,
      this.notifyParentR,
      {Key? key})
      : super(key: key);

  @override
  State<DefPollEdit> createState() => _DefPollEditState();
}

class _DefPollEditState extends State<DefPollEdit> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
          Expanded(
              flex: 5,
              child: SwiftVote.defTextFormField(
                  "Option ${widget.i}", w, widget.cont)),
          Expanded(
              flex: 1,
              child: widget.isLast
                  ? IconButton(
                      onPressed: () {
                        widget.notifyParent();
                      },
                      icon: Icon(Icons.add_rounded))
                  : const SizedBox()),
          Expanded(
              flex: 1,
              child: widget.isLast
                  ? IconButton(
                      onPressed: () {
                        widget.notifyParentR();
                      },
                      icon: Icon(Icons.remove_rounded))
                  : const SizedBox()),
        ]),
        const SizedBox(
          height: 8,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: SwiftVote.getPollEditType(widget.pt)),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
