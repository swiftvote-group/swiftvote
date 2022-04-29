import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPollPage extends StatelessWidget {
  const EmptyPollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        SvgPicture.asset("assets/images/voteinfo.svg"),
        const SizedBox(
          height: 8,
        ),
        Text("No Polls Here"),
        const Spacer(),
      ],
    );
  }
}
