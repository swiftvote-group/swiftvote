import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/chart/bar/vbar.dart';
import 'package:swiftvote/chart/line/mline.dart';
import 'package:swiftvote/home/poll/gamification.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class PollPage extends StatefulWidget {
  const PollPage({Key? key}) : super(key: key);

  @override
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  CandData cd = DummyData().cd;
  List<String> pos = DummyData.electionPos;

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
                  children: List.generate(
                      pos.length, (index) => PollPosInfo(cd, pos[index]))),
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
  final int timerMaxSeconds =
      (DateTime(2022, 3, 5, 23, 00).millisecondsSinceEpoch -
              DateTime.now().millisecondsSinceEpoch) ~/
          1000;

  final interval = const Duration(seconds: 1);

  int currentSeconds = 0;

  String get secText =>
      ((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0');

  String get minText => ((timerMaxSeconds - currentSeconds) ~/ 60 % 60)
      .toString()
      .padLeft(2, '0');

  String get hourText =>
      ((timerMaxSeconds - currentSeconds) ~/ 3600).toString().padLeft(2, '0');

  @override
  void initState() {
    dynamic duration = interval;
    Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          //print(timer.tick);
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        });
      }
    });
    super.initState();
  }

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
      timerCard('${hourText}hrs'),
      const SizedBox(
        width: 4,
      ),
      timerCard('${minText}mins'),
      const SizedBox(
        width: 4,
      ),
      timerCard('${secText}secs'),
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

Widget pollUser(Candidate cd, int tv, String pos) {
  return Builder(builder: (context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: cd.ccol!, width: 2),
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
        Text(
          cd.candName,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          pos,
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
          child: Text(
            "${cd.voteCount} votes     ${((cd.voteCount / tv) * 100).round()}%",
            style: TextStyle(
                color: Colors.white, fontFamily: 'NotoSans', fontSize: 12),
          ),
        ),
      ],
    );
  });
}

class PollPosInfo extends StatefulWidget {
  final String pos;
  final CandData cd;
  const PollPosInfo(this.cd, this.pos, {Key? key}) : super(key: key);

  @override
  _PollPosInfoState createState() => _PollPosInfoState();
}

class _PollPosInfoState extends State<PollPosInfo> {
  @override
  Widget build(BuildContext context) {
    List<Widget> charts = [
      VBar(cd: widget.cd),
      VBar(
        cd: widget.cd,
        isVertical: false,
      ),
    ];
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
                  "${widget.pos} Polling",
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
                  widget.cd.allCand!.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: pollUser(widget.cd.allCand![index],
                            widget.cd.totalVote, widget.pos),
                      )),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          CarouselSlider.builder(
              itemCount: charts.length,
              itemBuilder: (BuildContext ctx, int i, int j) {
                return charts[i];
              },
              options: CarouselOptions(
                aspectRatio: 1.7,
                enlargeCenterPage: true,
                viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
              )),
        ],
      ),
    );
  }
}
