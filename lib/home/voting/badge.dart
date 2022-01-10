import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home/mainpage.dart';
import 'package:swiftvote/swiftvote.dart';

class BadgePage extends StatefulWidget {
  const BadgePage({Key? key}) : super(key: key);

  @override
  State<BadgePage> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
  // Duration duration = const Duration(seconds: 1);

  // late final AnimationController _controller =
  //     AnimationController(vsync: this, duration: duration)
  //       ..repeat(reverse: true);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const MainPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftVote.primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/images/medal.svg",
              height: 64,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Here’s a badge for a vote!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

Widget eachBar(Color color) {
  return Container(
    margin: const EdgeInsets.all(2),
    height: 48,
    width: 8,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
  );
}
