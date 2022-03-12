import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swiftvote/home/positionpage.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class HomePage extends StatefulWidget {
  final CandData cd;
  const HomePage({required this.cd, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dum = DummyData.electionPos;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: "Hey there !  ",
                    style: const TextStyle(
                        fontSize: 18, color: SwiftVote.textColor),
                    children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SvgPicture.asset("assets/images/welcome.svg"))
                    ])),
                SizedBox(
                  width: h / 5,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)),
                        hintText: "Search for position",
                        hintStyle: const TextStyle(
                          color: SwiftVote.textColor,
                          fontSize: 12,
                          fontFamily: 'NotoSans',
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 32, minHeight: 32),
                        prefixIcon: const Icon(Icons.search_rounded)),
                  ),
                )
              ],
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select a position",
                style: TextStyle(
                  color: SwiftVote.textColor,
                  fontFamily: 'NotoSans',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: List.generate(
                    dum.length, (index) => PositionCard(widget.cd, dum[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PositionCard extends StatelessWidget {
  final String vc;
  final CandData cd;
  const PositionCard(this.cd, this.vc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => PositionPage(cd, vc),
          ),
        );
      },
      child: Container(
        width: h / 4,
        height: h / 4,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  SwiftVote.defRandColors()[DummyData.electionPos.indexOf(vc)],
              width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                bottom: 8,
                child: Text(
                  vc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: SwiftVote.primaryColor, fontSize: 16),
                )),
            Positioned(
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/images/defpic.svg",
                height: 0.15 * h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
