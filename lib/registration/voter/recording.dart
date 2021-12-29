import 'package:flutter/material.dart';
import 'package:swiftvote/home/mainpage.dart';
import 'package:swiftvote/swiftvote.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({Key? key}) : super(key: key);

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage>
    with TickerProviderStateMixin {
  Duration duration = const Duration(seconds: 1);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 10), () {
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0.0, 0.2),
                ).animate(CurvedAnimation(
                  parent: AnimationController(vsync: this, duration: duration)
                    ..repeat(reverse: true),
                  curve: Curves.linear,
                )),
                child: eachBar(const Color(0xFFED4C5C)),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.1),
                  end: const Offset(0.0, 0.1),
                ).animate(CurvedAnimation(
                  parent: AnimationController(vsync: this, duration: duration)
                    ..repeat(reverse: true),
                  curve: Curves.linear,
                )),
                child: eachBar(const Color(0xFFFBC801)),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.2),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: AnimationController(vsync: this, duration: duration)
                    ..repeat(reverse: true),
                  curve: Curves.linear,
                )),
                child: eachBar(const Color(0xFFBA68C8)),
              ),
            ]),
            const SizedBox(
              height: 16,
            ),
            const Text("Recording",
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
