import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/swiftvote.dart';

class GamificationPage extends StatelessWidget {
  const GamificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SwiftVote.defAppBar("Gamification Feature"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/game.svg",
              height: h / 2.7,
            ),
            const SizedBox(
              height: 32,
            ),
            Text.rich(TextSpan(
                text: "This feature is coming your way soon",
                children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child:
                          SvgPicture.asset("assets/images/crossed-fingers.svg"))
                ])),
            const Spacer(),
            SwiftVote.defButton(context, null, "Okay"),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
