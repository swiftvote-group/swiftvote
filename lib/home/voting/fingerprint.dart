import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swiftvote/home/voting/badge.dart';
import 'package:swiftvote/swiftvote.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwiftVote.defAppBar("Fingerprint"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Icon(
                Icons.fingerprint,
                color: Color(0xFF43484B),
                size: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SwiftVote.backgroundCard(
                context,
                FingerScanAnimation(
                    _controller, MediaQuery.of(context).size.height)),
            const SizedBox(
              height: 16,
            ),
            const Text("Hold your THUMB on the screen to stamp your vote!"),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      _controller.reset();
                    },
                    child: Text.rich(TextSpan(children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SvgPicture.asset(
                            "assets/images/retry.svg",
                            height: 16,
                          )),
                      const TextSpan(
                          text: "  Retry",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: SwiftVote.primaryColor))
                    ])),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size?>(
                          const Size.fromHeight(24)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: SwiftVote.primaryColor),
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const BadgePage(),
                          ),
                        );
                      });
                    },
                    child: Text.rich(TextSpan(children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SvgPicture.asset(
                            "assets/images/welcome.svg",
                            height: 16,
                          )),
                      const TextSpan(
                          text: "  Awesome",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white))
                    ])),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size?>(
                          const Size.fromHeight(24)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          SwiftVote.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: SwiftVote.primaryColor),
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FingerScanAnimation extends StatelessWidget {
  FingerScanAnimation(this.controller, this.nHeight, {Key? key})
      : height = Tween<double>(begin: 0.0, end: nHeight / 5.1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.linear,
          ),
        ),
        borderTop = Tween<double>(begin: 0.0, end: (nHeight / 3) - 32).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.linear,
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> height;
  final double nHeight;
  final Animation<double> borderTop;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: h / 5.1,
          width: h / 5.1,
          color: const Color(0xFFB2A9A9),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height.value,
              width: h / 5.1,
              color: Colors.lightGreenAccent,
            ),
          ),
        ),
        GestureDetector(
            onLongPressStart: (LongPressStartDetails lpsd) {
              controller.forward();
            },
            onLongPressEnd: (LongPressEndDetails lped) {
              if (controller.isAnimating) {
                controller.reset();
              }
            },
            child: SvgPicture.asset(
              "assets/images/fingerprint.svg",
              height: h / 5,
            )),
        Positioned(
          top: borderTop.value,
          child: Container(
            width: w,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 4,
                  color: Color(0xFF4D4B4B),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
