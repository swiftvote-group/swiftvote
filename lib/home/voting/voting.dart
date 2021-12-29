import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({Key? key}) : super(key: key);

  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SwiftVote.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              const VotingCard(),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Confirm your vote",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'NotoSans',
                    color: Colors.white),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "No, don't vote!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSans'),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size?>(
                          Size.copy(const Size(150, 24))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                        vertical: 16,
                      )),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Yes! Vote",
                      style: TextStyle(
                          color: SwiftVote.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NotoSans'),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size?>(
                          Size.copy(const Size(150, 24))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                        vertical: 16,
                      )),
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ));
  }
}

class VotingCard extends StatelessWidget {
  const VotingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width / 4,
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
        ],
      ),
    );
  }
}
