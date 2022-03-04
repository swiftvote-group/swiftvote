import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home/positionpage.dart';
import 'package:swiftvote/swiftvote.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    dum.length, (index) => PositionCard(dum[index])),
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
  const PositionCard(this.vc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => PositionPage(vc),
          ),
        );
      },
      child: Container(
        width: h / 4,
        height: h / 4,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.accents[Random().nextInt(Colors.accents.length)],
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Text(
                  vc,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: SwiftVote.primaryColor, fontSize: 16),
                )),
            Positioned(
              bottom: 0,
              right: 0,
              child: FlutterLogo(size: 0.15 * h),
            )
          ],
        ),
      ),
    );
  }
}
