import 'package:flutter/material.dart';
import 'package:swiftvote/home/user/userheader.dart';
import 'package:swiftvote/home/user/userhistory.dart';
import 'package:swiftvote/registration/abouttologout.dart';
import 'package:swiftvote/swiftvote.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<String> settingsName = [
    "Vote History",
    "Mode",
    "Help and feedback",
    "Support"
  ];
  List<String> subTitleName = ["8 votes", "Light", "", ""];
  List<IconData> listIcons = [
    Icons.how_to_vote,
    Icons.light_mode,
    Icons.help,
    Icons.volunteer_activism,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            UserHeaderPage(),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(settingsName[index]),
                      subtitle: Text(
                        subTitleName[index],
                        style: TextStyle(fontFamily: 'NotoSans', fontSize: 12),
                      ),
                      leading: Icon(listIcons[index]),
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const UserhistoryPage(),
                            ),
                          );
                        }
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int a) {
                    return const Divider();
                  },
                  itemCount: 4),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const AboutToLogOutPage(),
                  ),
                );
              },
              child: const Text.rich(TextSpan(children: [
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(Icons.logout, color: SwiftVote.primaryColor)),
                TextSpan(
                    text: "  Log out",
                    style: TextStyle(
                      fontSize: 16,
                      color: SwiftVote.primaryColor,
                    ))
              ])),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(8),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 48)),
              ),
            ),
            SizedBox(
              height: 64,
            ),
          ],
        ),
      )),
    );
  }
}