import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home/poll/gamification.dart';
import 'package:swiftvote/home/voting/voting.dart';
import 'package:swiftvote/swiftvote.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwiftVote.defAppBar("Candidate",
          hasBack: true,
          context: context,
          hasBottom: false,
          bColor: SwiftVote.primaryColor,
          tColor: Colors.white),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: (MediaQuery.of(context).size.height - 56) / 4,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: SwiftVote.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
              )),
          Positioned(top: 32, left: 0, right: 0, child: profHeader()),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 2,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: const Color(0xFFE6EAEF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Manifesto\n",
                        style:
                            TextStyle(color: SwiftVote.textColor, fontSize: 16),
                      ),
                      Text(
                          "I am Jerry Dike, from the department of electronic engineering. I am an advocate of progress and unity. I am a voice of the voiceless and the mouth of the mouthless, the speech of the speechless and finally, the talk of the talkless.\n\nVote for me as I contest for the SUG position. I seek to develop some electronic stuff here in this university and make this university the best best with the best electronic gadgetries.  Michael enters inside and sees Alex and his student in Melissa’s office. Alex and Michael greet very well and Alex tells him that Melissa contacted him and showed him his research.\n\nHe is very surprised to see his great and would love to meet in person. Michael tells him that he was waiting for a publication. Alex brings up the idea that he can publish the research in America, but if only his friends commitment would allow him to leave the country.",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 14,
                              color: SwiftVote.textColor)),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget profBio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Jerry Dike",
          style: TextStyle(color: SwiftVote.primaryColor),
        ),
        Text("SUG President", style: TextStyle(fontFamily: 'NotoSans')),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFE4E0E0),
          ),
          child: const Text.rich(TextSpan(
              text: "Votes\n",
              style: TextStyle(fontFamily: 'NotoSans', fontSize: 12),
              children: [
                TextSpan(
                    text: "134,009\t\t",
                    style: TextStyle(fontFamily: 'NotoSans', fontSize: 14),
                    children: [
                      WidgetSpan(child: Icon(Icons.analytics_outlined))
                    ])
              ])),
        )
      ],
    );
  }

  Widget profHeader() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      width: double.maxFinite,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // image: DecorationImage(image: ())
                ),
                child: SvgPicture.asset(
                  "assets/images/defpic.svg",
                  height: 100,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              profBio()
            ],
          ),
          SizedBox(height: 8),
          Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const GamificationPage(),
                      ),
                    );
                  },
                  child: const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.poll_outlined,
                          color: SwiftVote.primaryColor,
                        )),
                    TextSpan(
                        text: "  Predict",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: SwiftVote.primaryColor))
                  ])),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side:
                                const BorderSide(color: SwiftVote.primaryColor),
                            borderRadius: BorderRadius.circular(16))),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const VotingPage(),
                        ),
                      );
                    });
                  },
                  child: const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.how_to_vote,
                          color: Colors.white,
                        )),
                    TextSpan(
                        text: "  Vote",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white))
                  ])),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        SwiftVote.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side:
                                const BorderSide(color: SwiftVote.primaryColor),
                            borderRadius: BorderRadius.circular(16))),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24)),
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
