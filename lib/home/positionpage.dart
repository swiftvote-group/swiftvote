import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

class PositionPage extends StatelessWidget {
  const PositionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftVote.primaryColor,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_rounded)),
          title: Text("SUG", style: TextStyle(fontSize: 20)),
          actions: []),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(7, (index) => CandidateCard()),
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
      height: MediaQuery.of(context).size.height / 3.2,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height / 12,
            child: FlutterLogo(
              size: 100,
            ),
          ),
          Text(
            "Jerry Dike",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            "SUG President",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontFamily: 'NotoSans'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "View Profile",
                  style: TextStyle(
                      color: SwiftVote.primaryColor,
                      fontSize: 14,
                      fontFamily: 'NotoSans'),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          side: BorderSide(color: SwiftVote.primaryColor),
                          borderRadius: BorderRadius.circular(16))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 48)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Vote",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'NotoSans'),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(SwiftVote.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          side: BorderSide(color: SwiftVote.primaryColor),
                          borderRadius: BorderRadius.circular(16))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 48)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
