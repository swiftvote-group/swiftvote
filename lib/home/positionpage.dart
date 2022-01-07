import 'package:flutter/material.dart';
import 'package:swiftvote/home/voting/voting.dart';
import 'package:swiftvote/registration/abouttologout.dart';
import 'package:swiftvote/swiftvote.dart';

class PositionPage extends StatelessWidget {
  const PositionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftVote.primaryColor,
      appBar: AppBar(
        backgroundColor: SwiftVote.primaryColor,
        elevation: 0,
        actions: const [LiveWidget()],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text("SUG", style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(7, (index) => const CandidateCard()),
          ),
        ),
      ),
    );
  }
}

class CandidateCard extends StatelessWidget {
  const CandidateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.1,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height / 12,
            child: const FlutterLogo(
              size: 100,
            ),
          ),
          const Text(
            "Jerry Dike",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const Text(
            "SUG President",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: 'NotoSans'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AboutToLogOutPage(),
                    ),
                  );
                },
                child: const Text(
                  "View Profile",
                  style: TextStyle(
                      color: SwiftVote.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSans'),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size?>(
                      Size.copy(const Size(140, 24))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          side: const BorderSide(color: SwiftVote.primaryColor),
                          borderRadius: BorderRadius.circular(16))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  )),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const VotingPage(),
                    ),
                  );
                },
                child: const Text(
                  "Vote",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSans'),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size?>(
                      Size.copy(const Size(140, 24))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(SwiftVote.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          side: const BorderSide(color: SwiftVote.primaryColor),
                          borderRadius: BorderRadius.circular(16))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  )),
                ),
              ),
            ],
          )
        ],
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
