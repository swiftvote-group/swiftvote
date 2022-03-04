import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swiftvote/registration/admin/adminreg.dart';
import 'package:swiftvote/registration/splashscreen/splashscreen.dart';
import 'package:swiftvote/swiftvote.dart';

class AboutToLogOutPage extends StatefulWidget {
  const AboutToLogOutPage({Key? key}) : super(key: key);

  @override
  _AboutToLogOutPageState createState() => _AboutToLogOutPageState();
}

class _AboutToLogOutPageState extends State<AboutToLogOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SwiftVote.primaryColor,
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(32),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: const Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      )),
                ),
              ),
            ),
            const Positioned(
                left: 0, right: 0, top: 0, bottom: 0, child: CenterLogOut())
          ],
        ));
  }
}

Widget iconItem(String data, IconData iconData, bool isChecked) {
  return CircleAvatar(
    radius: 36,
    backgroundColor: isChecked ? SwiftVote.primaryColor : Colors.white,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: isChecked ? Colors.white : SwiftVote.primaryColor,
          size: 32,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          data,
          style: TextStyle(
              fontSize: 11,
              fontFamily: 'NotoSans',
              color: isChecked ? Colors.white : SwiftVote.primaryColor),
        )
      ],
    ),
  );
}

class CenterLogOut extends StatefulWidget {
  const CenterLogOut({Key? key}) : super(key: key);

  @override
  _CenterLogOutState createState() => _CenterLogOutState();
}

class _CenterLogOutState extends State<CenterLogOut> {
  Map<String, IconData> myMap = {
    "Happy": Icons.sentiment_satisfied_rounded,
    "Okay": Icons.sentiment_neutral_rounded,
    "Sad": Icons.sentiment_dissatisfied_rounded
  };

  int _cur = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(32),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.2,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  iconSize: 24,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )),
            const Text(
              "You’re about to log-out",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Take a few seconds to tell us how you feel?",
              style: TextStyle(fontSize: 10, fontFamily: 'NotoSans'),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(myMap.length, (index) {
                MapEntry<String, IconData> eachItem =
                    myMap.entries.elementAt(index);
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        _cur = index;
                      });
                    },
                    child:
                        iconItem(eachItem.key, eachItem.value, _cur == index));
              }),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Write a review",
                    hintStyle: TextStyle(
                        color: SwiftVote.textColor, fontFamily: 'NotoSans')),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const SplashScreen(
                      cstate: 3,
                    ),
                  ),
                );
              },
              child: const Text(
                "Thanks!",
                style: TextStyle(
                  color: SwiftVote.primaryColor,
                  fontSize: 15,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        side: const BorderSide(color: SwiftVote.primaryColor),
                        borderRadius: BorderRadius.circular(16))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 48)),
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
