import 'package:flutter/material.dart';
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(32),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 32,
                  )),
              Text(
                "You’re about to log-out",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Take a few seconds to tell us how you feel?",
                style: TextStyle(fontSize: 10, fontFamily: 'NotoSans'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
