// This is a static class that contains constants and the likes.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

import 'package:swiftvote/models/shortmodels.dart';

class SwiftVote {
  //General
  static const primaryColor = Color(0XFF003478);
  static const textColor = Color(0xFF22272E);

  //Splashscreen --- ss
  static const ssprogressFill = Color(0XFF407BFF);
  static const ssprogressDefault = Color(0XFFAAC4FF);
  static const sstextColor = Color(0XFF22272E);
  static const ssbuttonColor = Color(0XFFCBDBFF);

  //For other screens put them below here

  static Widget adminPageText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: const TextStyle(
              fontSize: 18,
            )),
      ),
    );
  }

  //Buttons
  static ButtonStyle defButtonStyle({Color color = primaryColor}) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16))),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 48)),
      //minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(56)),
    );
  }

  //Text
  static TextStyle defTextStyle({Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontSize: 15,
    );
  }

  static List<Color> defRandColors({int j = 7}) {
    List<Color> aColors = [];
    List<Color> defColor = [];
    aColors.addAll(Colors.accents);
    aColors.shuffle();
    for (int i = 0; i < j; i++) {
      defColor.add(aColors[i]);
    }
    return defColor;
  }

  static AppBar defAppBar(String title,
      {bool hasBack = false,
      BuildContext? context,
      bool hasBottom = true,
      Color bColor = Colors.white,
      Color tColor = SwiftVote.textColor}) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: tColor),
      ),
      leading: hasBack
          ? IconButton(
              onPressed: () {
                Navigator.of(context!).pop();
              },
              icon: Icon(
                Icons.chevron_left_rounded,
                color: tColor,
              ))
          : null,
      backgroundColor: bColor,
      elevation: 0,
      bottom: hasBottom
          ? PreferredSize(
              child: Container(
                color: const Color(0xFF726F6F),
                height: 1.0,
              ),
              preferredSize: const Size.fromHeight(1.0))
          : null,
    );
  }

  static TextButton defButton(BuildContext context, Widget? screen, String data,
      {Color bcolor = primaryColor, bool isWide = false}) {
    return TextButton(
      onPressed: screen == null
          ? () {
              Navigator.of(context).pop();
            }
          : () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => screen,
                ),
              );
            },
      child: Text(
        data,
        style: TextStyle(
            color: bcolor == primaryColor ? Colors.white : primaryColor,
            fontSize: 16),
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size?>(
            isWide ? const Size.fromHeight(24) : null),
        backgroundColor: MaterialStateProperty.all<Color>(bcolor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 48)),
      ),
    );
  }

  static Widget defTextFormField(
      String hint, double width, TextEditingController _controller) {
    return SizedBox(
      width: width - 32,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF7D848D)),
              borderRadius: BorderRadius.circular(8),
            ),
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, fontFamily: 'NotoSans')),
      ),
    );
  }

  static Widget defNumberField(
      BuildContext context, TextEditingController _controller,
      {bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: _controller,
        maxLength: 1,
        style: const TextStyle(
            fontSize: 20, fontFamily: 'NotoSans', color: SwiftVote.textColor),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          if (value.length == 1) {
            isLast
                ? FocusScope.of(context).unfocus()
                : FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
          counterText: '',
          constraints: BoxConstraints(
              minWidth: 32, minHeight: 32, maxWidth: 48, maxHeight: 48),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF7D848D)),
          ),
        ),
      ),
    );
  }

  static Widget uniHeader() {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        child: SvgPicture.asset(
          "assets/images/defpic.svg",
          height: 32,
        ),
      ),
      title: Text("University of Nigeria,Nsukka"),
      subtitle: Text(
        "General Electoral Vote",
        style: TextStyle(
            fontFamily: 'NotoSans', color: SwiftVote.textColor, fontSize: 13),
      ),
    );
  }

  static double? getBarWidth(int tvote, bool isV) {
    double? h;
    if (tvote >= 8) {
      h = null;
    } else if (tvote >= 6) {
      h = 16;
    } else if (tvote >= 4) {
      h = 32;
    } else if (tvote >= 2) {
      h = 64;
    }
    return isV ? h : (h == null ? null : h / 2);
  }

  static Widget candListTile(BuildContext ctx,
      {String name = "Chijiofor Ebube",
      double percent = 67,
      Color pcol = Colors.white}) {
    return ListTile(
      horizontalTitleGap: 0,
      title: Text(name),
      subtitle: Text(
        "${percent.round()}% votes",
        style: const TextStyle(fontFamily: 'NotoSans', fontSize: 12),
      ),
      minLeadingWidth: 65,
      leading: CircleAvatar(
        radius: 28,
        child: SvgPicture.asset(
          "assets/images/defpic.svg",
          height: 32,
        ),
      ),
      trailing: SizedBox(
        width: MediaQuery.of(ctx).size.width / 3,
        child: LinearProgressIndicator(
          value: percent / 100,
          backgroundColor: Color(0xFFD8E2E2),
          color: pcol == Colors.white
              ? Colors.accents[Random().nextInt(Colors.accents.length - 1)]
              : pcol,
        ),
      ),
    );
  }

  static Widget dropdownField(String hint, double width) {
    String curVal = "Name of School";
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          width: width - 32,
          child: DropdownButtonFormField(
              icon: const Icon(Icons.arrow_drop_down_rounded),
              onChanged: (String? b) {
                setState(() {
                  curVal = b!;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF7D848D)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  hintText: hint,
                  hintStyle:
                      const TextStyle(fontSize: 13, fontFamily: 'NotoSans')),
              items: [
                dropdownItem("Name of School", true),
                dropdownItem("UNN1", false),
                dropdownItem("UNN2", false),
                dropdownItem("UNN3", false),
              ]),
        );
      },
    );
  }

  static DropdownMenuItem<String> dropdownItem(String data, bool isSelected) {
    return DropdownMenuItem<String>(
      value: data,
      child: Text(data,
          style: const TextStyle(fontSize: 13, fontFamily: 'NotoSans')),

      // Builder(builder: (context) {
      //   return SizedBox(
      //     width: MediaQuery.of(context).size.width - 64,
      //     child: RadioListTile(
      //       value: data,
      //       groupValue: isSelected,
      //       controlAffinity: ListTileControlAffinity.trailing,
      //       activeColor: textColor,
      //       secondary: const Icon(Icons.school),
      //       onChanged: (a) {},
      //       title: Text(data,
      //           style: const TextStyle(fontSize: 13, fontFamily: 'NotoSans')),
      //     ),
      //   );
      // })

      // Row(children: [
      //   Text(data,style: const TextStyle(fontSize: 13,fontFamily: 'NotoSans')),
      //   SizedBox(width: 32,),
      //   Radio(value: value, groupValue: groupValue, onChanged: onChanged)
      // ],),
    );
  }

  static Widget signinField(IconData iconData, String hint, double w) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: SizedBox(
        width: w,
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: Icon(iconData),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13, fontFamily: 'NotoSans'),
          ),
        ),
      ),
    );
  }

  static Widget livePollUserCircle(
    Color color,
    double percent,
  ) {
    return Builder(builder: (context) {
      double w = MediaQuery.of(context).size.width / 3.5;
      return Stack(
        alignment: Alignment.center,
        children: [
          CircularPercentIndicator(
            radius: w,
            lineWidth: w * 0.4,
            animation: true,
            startAngle: 122,
            percent: percent / 100,
            center: CircleAvatar(
              radius: w * 0.3,
              child: SvgPicture.asset(
                "assets/images/defpic.svg",
              ),
            ),
            progressColor: color,
            backgroundColor: const Color(0xFFDBDBDB),
          ),
          Positioned(
              bottom: 0.07 * w,
              child: Text(
                "$percent%",
                style: const TextStyle(
                    fontFamily: 'NotoSans', fontSize: 11, color: Colors.white),
              ))
        ],
      );
    });
  }

  static Widget livePollUser() {
    return Column(
      children: [
        livePollUserCircle(Colors.blue, 79),
        const SizedBox(
          height: 4,
        ),
        const Text("Onyiyechi Ada"),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "SUG President",
          style: TextStyle(fontFamily: 'NotoSans'),
        ),
      ],
    );
  }

  static Widget backgroundCard(BuildContext context, Widget? child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 4,
          color: const Color(0xFF1E1D1D),
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 4, color: Color(0xFFBDB8B8)),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              height: (MediaQuery.of(context).size.height / 3),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 2, color: const Color(0xFF3E3B3B)),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class VerificationScreen extends StatefulWidget {
  final List<TextEditingController> controllers;
  const VerificationScreen(this.controllers, {Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 900;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                SwiftVote.defNumberField(context, widget.controllers[0]),
                const Icon(
                  Icons.remove,
                ),
                SwiftVote.defNumberField(context, widget.controllers[1]),
                const Icon(Icons.remove),
                SwiftVote.defNumberField(context, widget.controllers[2]),
                const Icon(Icons.remove),
                SwiftVote.defNumberField(context, widget.controllers[3]),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Verification Code",
              style: TextStyle(color: SwiftVote.textColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text.rich(TextSpan(
                text:
                    "This code will automatically expire at the countdown of ",
                style: const TextStyle(
                    fontSize: 10,
                    color: SwiftVote.textColor,
                    fontFamily: 'NotoSans'),
                children: [
                  TextSpan(
                    text: timerText,
                    style: const TextStyle(color: Colors.red),
                  )
                ])),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Resend ?",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'NotoSans',
                  color: SwiftVote.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

class LiveWidget extends StatefulWidget {
  const LiveWidget({Key? key}) : super(key: key);

  @override
  _LiveWidgetState createState() => _LiveWidgetState();
}

class _LiveWidgetState extends State<LiveWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text.rich(TextSpan(children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Icon(
            Icons.radio_button_on_rounded,
            color: Colors.white,
            size: 16,
          ),
        ),
        TextSpan(
            text: " Live", style: TextStyle(color: Colors.white, fontSize: 16))
      ])),
    );
  }
}

class CompletedWidget extends StatelessWidget {
  const CompletedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF3CCE55),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text.rich(TextSpan(children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Icon(
            Icons.task_rounded,
            color: Colors.white,
            size: 16,
          ),
        ),
        TextSpan(
            text: " Completed",
            style: TextStyle(color: Colors.white, fontSize: 16))
      ])),
    );
  }
}

class AdminPosChange extends Notification {
  String posTitle = "SUG President";
  AdminPosChange(this.posTitle);
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final int timerMaxSeconds =
      (DateTime(2022, 4, 1, 23, 00).millisecondsSinceEpoch -
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
    return Text(
      "$hourText:$minText:$secText",
      style: TextStyle(
        fontSize: 15,
        color: SwiftVote.textColor.withOpacity(0.5),
      ),
    );
  }
}

class DummyData {
  static List<String> cdName = [
    "Ebube Chinedu",
    "Francisca John",
    "Henry Francis",
    "Anthony Ike",
    "Ebube John",
    "Francisca Anthony",
    "Ike Francis",
    "Paul Ike",
    "Clementina Obo",
    "Owelle Raphael"
  ];

  static List<String> electionPos = [
    "SUG President",
    "Vice President",
    "Senate",
    "DOS",
    "Governor",
    "Provost",
    "Financial Secretary",
  ];

  int tVote = 0;
  late CandData cd;

  DummyData() {
    List<Candidate> aCands = List.generate(Random().nextInt(8) + 2, (index) {
      int a = Random().nextInt(20);
      tVote += a;
      return Candidate(
          candName: cdName[index], candPosition: "SUG", voteCount: a);
    });
    cd = CandData(totalVote: tVote, allCand: aCands);
  }
}
