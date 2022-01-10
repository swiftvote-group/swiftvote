import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home/poll/gamification.dart';
import 'package:swiftvote/swiftvote.dart';

class PollPage extends StatefulWidget {
  const PollPage({Key? key}) : super(key: key);

  @override
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PollHeader(),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(3, (index) => const PollPosInfo())),
            ),
          ),
        ],
      ),
    );
  }
}

class PollHeader extends StatefulWidget {
  const PollHeader({Key? key}) : super(key: key);

  @override
  _PollHeaderState createState() => _PollHeaderState();
}

class _PollHeaderState extends State<PollHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const LiveWidget(),
      const SizedBox(
        width: 4,
      ),
      GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const GamificationPage(),
              ),
            );
          },
          child: SvgPicture.asset("assets/images/gamer.svg")),
      const Spacer(),
      timerCard("19hrs"),
      const SizedBox(
        width: 4,
      ),
      timerCard("32mins"),
      const SizedBox(
        width: 4,
      ),
      timerCard("15secs"),
      const SizedBox(
        width: 4,
      ),
    ]);
  }
}

Widget timerCard(String data) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xFFEFEFEF),
    ),
    child: Text(
      data,
      style: const TextStyle(color: Color(0xFFED0006), fontFamily: 'NotoSans'),
    ),
  );
}

Widget pollUser() {
  return Builder(builder: (context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
          ),
          child: CircleAvatar(
            radius: (MediaQuery.of(context).size.width / 5) - 8,
            child: const FlutterLogo(
              size: 100,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "Jerry Dike",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "SUG President",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: 'NotoSans'),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: SwiftVote.primaryColor,
          ),
          child: const Text(
            "30,057 votes     74%",
            style: TextStyle(
                color: Colors.white, fontFamily: 'NotoSans', fontSize: 12),
          ),
        ),
      ],
    );
  });
}

class PollPosInfo extends StatefulWidget {
  const PollPosInfo({Key? key}) : super(key: key);

  @override
  _PollPosInfoState createState() => _PollPosInfoState();
}

class _PollPosInfoState extends State<PollPosInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "SUG Polling",
                  style: TextStyle(fontSize: 16),
                ),
              )),
          SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  5,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: pollUser(),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
