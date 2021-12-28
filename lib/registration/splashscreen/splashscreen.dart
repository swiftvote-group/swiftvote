import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:swiftvote/registration/admin/adminreg.dart';
//import 'package:swiftvote/registration/voter/voterregistration.dart';
import 'package:swiftvote/swiftvote.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  int curState = 1;
  List<String> msg = [
    "Start your next online election in your school and save the stress!",
    "Get comprehensible voting analytics in detail and save data on cloud.",
    "You get all at your fingertip, the fun is yours to have!"
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    );
    _animation = Tween(begin: 0.0, end: 9.0).animate(_controller)
      ..addListener(() {
        setState(() {
          if (_animation.value > 6) {
            curState = 3;
          } else if (_animation.value > 3) {
            curState = 2;
          }
        });
      });

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customLPD(context, getVal(_animation.value, 3)),
                const SizedBox(
                  width: 8,
                ),
                customLPD(context, getVal(_animation.value, 6)),
                const SizedBox(
                  width: 8,
                ),
                customLPD(context, getVal(_animation.value, 9)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              msg[curState - 1],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: curState == 3
                ? const LastSplashScreen()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/images/sspage$curState.svg",
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                curState = 3;
                                _controller.value = 6.01;
                              });
                            },
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                  color: SwiftVote.textColor,
                                  fontFamily: 'NotoSans'),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  SwiftVote.ssprogressDefault),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 20)),
                            ),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/images/fulllogo.svg"),
                    ],
                  ),
          ),
        ],
      )),
    );
  }
}

Widget customLPD(BuildContext context, double val) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 4,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        color: SwiftVote.ssprogressFill,
        backgroundColor: SwiftVote.ssprogressDefault,
        value: val,
      ),
    ),
  );
}

double getVal(double realVal, int type) {
  double val = 0;
  if (type == 3) {
    val = realVal > type ? 3 : (realVal % 3);
  } else if (type == 6) {
    if (realVal > 3) {
      val = realVal > type ? 3 : (realVal % 3);
    } else {
      val = 0;
    }
  } else if (type == 9) {
    if (realVal > 6) {
      val = realVal == type ? 3 : (realVal % 3);
    } else {
      val = 0;
    }
  }
  return val / 3;
}

class LastSplashScreen extends StatefulWidget {
  const LastSplashScreen({Key? key}) : super(key: key);

  @override
  _LastSplashScreenState createState() => _LastSplashScreenState();
}

class _LastSplashScreenState extends State<LastSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                    color: SwiftVote.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute<void>(
                            //     builder: (BuildContext context) =>
                            //         const VoterRegistrationPage(),
                            //   ),
                            // );
                          },
                          child: Text("Voter", style: SwiftVote.defTextStyle()),
                          style: SwiftVote.defButtonStyle(),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute<void>(
                            //     builder: (BuildContext context) =>
                            //         const AdminRegPage(),
                            //   ),
                            // );
                          },
                          child: Text(
                            "Admin",
                            style: SwiftVote.defTextStyle(
                                color: SwiftVote.primaryColor),
                          ),
                          style: SwiftVote.defButtonStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/images/fulllogow.svg"),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.07,
              right: 16,
              left: 16,
              child: SvgPicture.asset(
                "assets/images/sspage3.svg",
                width: MediaQuery.of(context).size.width - 64,
              ))
        ],
      ),
    );
  }
}
