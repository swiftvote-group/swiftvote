import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home_admin/admindrawer.dart';
import 'package:swiftvote/home_admin/cand_activity/admincandactivity.dart';
import 'package:swiftvote/home_admin/profile/adminprofile.dart';
import 'package:swiftvote/home_admin/vote_activity/adminvoteactivity.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentScreen = 0;
  List<Widget> screens = [];
  Map<String, IconData> tabs = {
    "Candidates": Icons.person_rounded,
    "Voters": Icons.people_rounded,
    "Profile": Icons.space_dashboard,
  };

  //dummy data
  CandData cd = DummyData().cd;

  @override
  void initState() {
    screens = [
      AdminCandActivity(cd),
      AdminVoteActivity(cd: cd),
      const AdminProfilePage(),
    ];
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
      drawer: const AdminDrawer(),
      onDrawerChanged: (val) {
        setState(() {});
      },
      appBar: _currentScreen == 2
          ? null
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leadingWidth: 36,
              leading: Builder(builder: (ctx) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SvgPicture.asset(
                      "assets/images/hamss.svg",
                      width: 24,
                      height: 24,
                    ),
                  ),
                );
              }),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context,
                          delegate: CandCSD(
                              allCand: cd.allCand, tVote: cd.totalVote));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: SwiftVote.primaryColor,
                    ))
              ],
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

class CandCSD extends SearchDelegate {
  List<Candidate>? allCand;
  int tVote;
  CandCSD({this.tVote = 0, this.allCand})
      : super(
            searchFieldStyle: const TextStyle(
          fontFamily: 'NotoSans',
        ));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Candidate> queryCand = [];
    if (allCand == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("No Candidate"),
        ),
      );
    }
    for (Candidate c in allCand!) {
      if (c.candName.toLowerCase().contains(query.toLowerCase())) {
        queryCand.add(c);
      }
    }

    return ListView.builder(
        itemCount: queryCand.length,
        itemBuilder: (BuildContext context, int index) {
          Candidate cdf = queryCand[index];
          return SwiftVote.candListTile(context,
              name: cdf.candName,
              percent: cdf.percentVote(tVote),
              pcol: cdf.ccol!);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Candidate> queryCand = [];
    if (allCand == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("No Suggestions"),
        ),
      );
    }
    for (Candidate c in allCand!) {
      if (c.candName.toLowerCase().contains(query.toLowerCase())) {
        queryCand.add(c);
      }
    }

    return ListView.builder(
        itemCount: allCand!.length,
        itemBuilder: (BuildContext context, int index) {
          Candidate cdf = allCand![index];
          return SwiftVote.candListTile(context,
              name: cdf.candName,
              percent: cdf.percentVote(tVote),
              pcol: cdf.ccol!);
        });
  }
}
