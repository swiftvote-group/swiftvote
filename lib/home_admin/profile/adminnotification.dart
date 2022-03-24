import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminNotifPage extends StatefulWidget {
  const AdminNotifPage({Key? key}) : super(key: key);

  @override
  State<AdminNotifPage> createState() => _AdminNotifPageState();
}

class _AdminNotifPageState extends State<AdminNotifPage> {
  List<AdminNotificationModel> anms = List.generate(10, (index) {
    return AdminNotificationModel(
        "Reminder",
        "The election time remains only two minutes before links expire. Share links with voters to beat the time!",
        "3 hrs ago");
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SwiftVote.defAppBar("Notification",
            hasBack: true, context: context),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: anms.length,
            itemBuilder: (BuildContext context, int i) => notif(anms[i])));
  }

  Widget notif(AdminNotificationModel anm) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 8, right: 4, left: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.notifications,
              size: 20,
              color: SwiftVote.primaryColor,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "${anm.notifType}:",
              style: TextStyle(
                  fontFamily: 'NotoSans', color: SwiftVote.primaryColor),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                    text: "${anm.notifDesc} \n",
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                    ),
                    children: [
                      TextSpan(
                        text: "${anm.notifTime}",
                        style: TextStyle(
                            fontFamily: 'NotoSans', color: Colors.grey),
                      ),
                    ]),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }
}
