import 'package:flutter/material.dart';
import 'package:swiftvote/home/homepage.dart';
import 'package:swiftvote/swiftvote.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentScreen = 0;
  List<Widget> screens = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage()
  ];
  Map<String, IconData> tabs = {
    "Home": Icons.home_rounded,
    "Listing": Icons.people_alt_rounded,
    "Poll": Icons.equalizer_rounded,
    "Me": Icons.person_rounded,
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
