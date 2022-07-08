import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftvote/home/poll/gamification.dart';
import 'package:swiftvote/home/user/userpage.dart';
import 'package:swiftvote/poll_feature/poll_home.dart';
import 'package:swiftvote/swiftvote.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _currentScreen = 0;
  List<Widget> screens = [];
  Map<String, IconData> tabs = {
    "Home": Icons.home_rounded,
    "Me": Icons.person_rounded,
  };
  List<String> titles = [
    "New Election",
    "Join Election",
    "Create Poll",
    "Games"
  ];

  List<IconData> titleIcon = [
    Icons.how_to_vote_outlined,
    Icons.add,
    Icons.leaderboard_rounded,
    Icons.gamepad_rounded
  ];

  @override
  void initState() {
    screens = [exploreHome(), const UserPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: screens[_currentScreen],
        ),
      ),
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

  Widget exploreHome() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwiftVote.regHeader(
              "Explore voting products", "Brought to you by Swiftally Limited"),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) => activityCard(index)),
          ),
          const Spacer(),
          Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/blockchain.png")),
          const SizedBox(
            height: 24,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Powered by Blockchain",
              style: TextStyle(color: SwiftVote.sstextColor.withOpacity(0.1)),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  Widget activityCard(int i) {
    return GestureDetector(
      onTap: () {
        if (i == 0) {
          ScaffoldMessenger.of(context).showSnackBar(SwiftVote.infoBar(
              "Please check https://www.swiftvote.io to create an election"));
        } else if (i == 1) {
          //
        } else if (i == 2) {
          Get.to(PollHomePage());
        } else if (i == 3) {
          Get.to(GamificationPage());
        }
      },
      child: SizedBox(
        width: (Get.width - 128) / 4,
        height: (Get.width - 128) / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: i == 0 ? Color(0xFFFFC727) : Color(0xFF3868A6),
              ),
              child: Icon(
                titleIcon[i],
                color: Colors.white,
              ),
            ),
            Text(
              titles[i],
              style: TextStyle(fontFamily: "NotoSans", fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
