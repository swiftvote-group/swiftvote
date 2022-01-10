import 'package:flutter/material.dart';
import 'package:swiftvote/home_admin/vote_activity/adminvoteactivity.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentScreen = 0;
  List<Widget> screens = [
    const AdminVoteActivity(),
    const AdminVoteActivity(),
    const AdminVoteActivity(),
  ];
  Map<String, IconData> tabs = {
    "Home": Icons.space_dashboard,
    "Poll": Icons.equalizer_rounded,
    "Me": Icons.contact_mail_rounded,
  };

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
}
