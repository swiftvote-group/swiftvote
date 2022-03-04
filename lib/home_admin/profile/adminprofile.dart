import 'package:flutter/material.dart';
import 'package:swiftvote/error/errorpage.dart';
import 'package:swiftvote/home_admin/profile/adminprofileheader.dart';
import 'package:swiftvote/registration/abouttologout.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  List<String> settingsName = [
    "Election History",
    "Notification",
    "Policy and Pricing",
    "Help and feedback",
    "Support"
  ];
  List<String> subTitleName = ["No history", "7 new", "Read", "", ""];
  List<IconData> listIcons = [
    Icons.av_timer_rounded,
    Icons.notifications,
    Icons.privacy_tip_rounded,
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
            AdminHeaderPage(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ErrorPage(index),
                          ),
                        );
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
              height: 16,
            ),
          ],
        ),
      )),
    );
  }
}
