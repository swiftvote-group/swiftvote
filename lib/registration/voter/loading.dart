import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/registration/voter/voterregistration.dart';
import 'package:swiftvote/swiftvote.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  Duration duration = const Duration(seconds: 1);
  bool isScreen1 = true;

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: duration)
        ..repeat(reverse: true);

  late final AnimationController _controller2 =
      AnimationController(vsync: this, duration: duration);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isScreen1 = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftVote.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: isScreen1 ? screen1() : screen2(),
        ),
      ),
    );
  }

  Widget screen1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 0.5).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeIn)),
            child: SvgPicture.asset("assets/images/loading.svg",
                height: MediaQuery.of(context).size.height / 10)),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Loading",
          style: TextStyle(fontSize: 14, color: Colors.white),
        )
      ],
    );
  }

  Widget screen2() {
    _controller2.forward();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizeTransition(
                sizeFactor: CurvedAnimation(
                    parent: _controller2, curve: Curves.bounceIn),
                child: SvgPicture.asset(
                  "assets/images/celebration.svg",
                  height: 64,
                ),
              ),
              SizeTransition(
                sizeFactor: CurvedAnimation(
                    parent: _controller2, curve: Curves.bounceIn),
                child: SvgPicture.asset("assets/images/celebration.svg",
                    height: 64),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        const Text(
          "Link Approved",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        const Spacer(),
        SwiftVote.defButton(
          context,
          const VoterRegistrationPage(),
          "Awesome",
          isWide: true,
          bcolor: Colors.white,
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
