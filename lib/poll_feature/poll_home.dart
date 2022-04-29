import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home/poll/gamification.dart';
import 'package:swiftvote/home/user/userpage.dart';
import 'package:swiftvote/poll_feature/empty_poll.dart';
import 'package:swiftvote/poll_feature/poll_edit.dart';
import 'package:swiftvote/poll_feature/polllist.dart';
import 'package:swiftvote/swiftvote.dart';

class PollHomePage extends StatefulWidget {
  const PollHomePage({Key? key}) : super(key: key);

  @override
  State<PollHomePage> createState() => _PollHomePageState();
}

class _PollHomePageState extends State<PollHomePage> {
  int _currentScreen = 0;
  List<Widget> screens = [];
  Map<String, IconData> tabs = {
    "Polls": Icons.poll_rounded,
    "Games": Icons.games_rounded,
    "Me": Icons.person_rounded,
  };

  @override
  void initState() {
    screens = [
      const PollPageWE(),
      const GamificationPage(),
      const UserPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[_currentScreen]),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: SwiftVote.primaryColor,
          unselectedItemColor: SwiftVote.textColor,
          onTap: (i) {
            setState(() {
              if (_currentScreen != i) {
                _currentScreen = i;
              }
            });
          },
          currentIndex: _currentScreen,
          items: List.generate(tabs.length, (index) {
            MapEntry<String, IconData> eachTab = tabs.entries.elementAt(index);
            return BottomNavigationBarItem(
              icon: Icon(eachTab.value),
              label: eachTab.key,
            );
          })),
    );
  }
}

class PollPageWE extends StatefulWidget {
  const PollPageWE({Key? key}) : super(key: key);

  @override
  State<PollPageWE> createState() => _PollPageWEState();
}

class _PollPageWEState extends State<PollPageWE>
    with SingleTickerProviderStateMixin {
  late TabController tcont;
  bool isMyPolls = true;

  @override
  void initState() {
    tcont = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width / 1.5;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text.rich(TextSpan(
              text: "Got a longing question ?  ",
              style: TextStyle(fontSize: 16),
              children: [
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: SvgPicture.asset(
                      "assets/images/thinkemoji.svg",
                      height: 24,
                    ))
              ])),
          const SizedBox(
            height: 4,
          ),
          Text("Create a poll and get a real time responses",
              style: TextStyle(fontSize: 12, fontFamily: 'NotoSans')),
          const SizedBox(
            height: 16,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: SwiftVote.ssprimaryborder),
              ),
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Gather more insights and opinions",
                    style: TextStyle(fontSize: 16),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Create quick polls and share across various platforms to understand from different individuals’ perspectives.",
                        style: TextStyle(fontFamily: 'NotoSans'),
                        textAlign: TextAlign.center),
                  ),
                  SwiftVote.defButton(
                    context,
                    PollEditPage(),
                    "Create Poll",
                    porr: true,
                  )
                ],
              )),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 6,
                child: SwiftVote.pcovtab(
                  SizedBox(
                    height: 32,
                    width: w,
                    child: TabBar(
                      tabs: [
                        Tab(text: "My Polls"),
                        Tab(text: "Public Polls"),
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
                          isMyPolls = i == 0;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.sort_rounded))),
            ],
          ),
          Expanded(child: isMyPolls ? EmptyPollPage() : PollListPage()),
        ],
      ),
    );
  }
}
