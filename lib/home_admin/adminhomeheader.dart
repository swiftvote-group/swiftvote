import 'package:flutter/material.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';
import 'package:provider/provider.dart';

class AdminHomeHeader extends StatefulWidget {
  final CandData? cd;
  const AdminHomeHeader({this.cd, Key? key}) : super(key: key);

  @override
  _AdminHomeHeaderState createState() => _AdminHomeHeaderState();
}

class _AdminHomeHeaderState extends State<AdminHomeHeader> {
  late List<AhItemModel> ahitems;
  String title = "";

  @override
  void initState() {
    ahitems = [
      AhItemModel(
          "Votes", widget.cd!.totalVote.toString(), Icons.how_to_vote_outlined),
      AhItemModel("Voters", "300", Icons.people_rounded),
      AhItemModel("Candidates", widget.cd!.allCand!.length.toString(),
          Icons.person_rounded),
      AhItemModel("Countdown", "09:04:05", Icons.access_time_rounded),
    ];
    final String? adminPos = MyPrefs.getDef("ADMIN_POS");
    title = adminPos ?? "SUG President";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          SwiftVote.adminPageText(
              Provider.of<MyNotif>(context).posTitle ?? title + " Report"),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              AhItemModel ah = ahitems[index];
              if (index == 3) {
                return AhItems(
                  ah,
                  timerDown: const TimerWidget(),
                );
              }
              return AhItems(ah);
            }),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

class AhItems extends StatelessWidget {
  final AhItemModel ah;
  final Widget? timerDown;
  const AhItems(this.ah, {this.timerDown, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width - 32) / 4;
    return Container(
      width: w,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFE7EDED),
      ),
      child: Column(
        children: [
          Icon(
            ah.icon,
            color: SwiftVote.primaryColor.withOpacity(0.5),
          ),
          const SizedBox(
            height: 4,
          ),
          timerDown ??
              Text(
                ah.value,
                style: TextStyle(
                  fontSize: 15,
                  color: SwiftVote.textColor.withOpacity(0.5),
                ),
              ),
          const SizedBox(
            height: 4,
          ),
          Text(
            ah.title,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 12,
              color: SwiftVote.textColor.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}

class AhItemModel {
  String title, value;
  IconData icon;
  AhItemModel(this.title, this.value, this.icon);
}
