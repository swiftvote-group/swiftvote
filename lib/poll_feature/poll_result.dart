import 'package:flutter/material.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class PollResult extends StatefulWidget {
  final String title, num, extra, desc;
  final PollChooserItem pci;
  final bool isResult;
  const PollResult(
      this.title, this.num, this.extra, this.desc, this.pci, this.isResult,
      {Key? key})
      : super(key: key);

  @override
  State<PollResult> createState() => _PollResultState();
}

class _PollResultState extends State<PollResult> {
  late String title, num, extra, desc;
  late PollChooserItem pci;
  late bool isRes;

  @override
  void initState() {
    title = widget.title;
    num = widget.num;
    extra = widget.extra;
    desc = widget.desc;
    pci = widget.pci;
    isRes = widget.isResult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PollHeader(title, num, extra, desc),
          PollChooser(pci, isRes)
        ],
      ),
    );
  }
}

class PollHeader extends StatelessWidget {
  final String title, num, extra, desc;
  const PollHeader(this.title, this.num, this.extra, this.desc, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 8, width: double.maxFinite),
      Text(title, style: TextStyle(fontSize: 16)),
      const SizedBox(height: 8),
      Text("Total responses : $num - $extra",
          style: TextStyle(fontSize: 12, fontFamily: 'NotoSans')),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: SwiftVote.ssprimaryborder),
        ),
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height / 5,
        width: double.maxFinite,
        child: Text(
          desc,
          style: TextStyle(fontFamily: 'NotoSans'),
          maxLines: 5,
        ),
      )
    ]);
  }
}

class PollChooser extends StatefulWidget {
  final PollChooserItem pci;
  final bool isAdmin;
  const PollChooser(this.pci, this.isAdmin, {Key? key}) : super(key: key);

  @override
  State<PollChooser> createState() => _PollChooserState();
}

class _PollChooserState extends State<PollChooser> {
  int curChoice = 0;
  bool isPressed = false;

  @override
  void initState() {
    isPressed = widget.isAdmin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 8, width: double.maxFinite),
      ...List.generate(widget.pci.choices.length, (index) {
        final s = widget.pci.choices[index];
        final pt = widget.pci.pt;
        final m = widget.pci.getChooserItem()[s];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 6,
            ),
            pt == PollType.choice
                ? SwiftVote.pollChoice(s, index,
                    shdOn: !widget.isAdmin,
                    ist: isPressed,
                    initVotes: widget.pci.choiceMaps[s]!,
                    totalVotes: widget.pci.tchoices, defFunc: (a, b) {
                    setState(() {
                      curChoice = b;
                      isPressed = true;
                    });
                  })
                : SwiftVote.pcovO(SizedBox(
                    width: double.maxFinite,
                    height: 40,
                    child: Center(child: Text(s)))),
            const SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: PollChooserResult(pt, m, true, index, isPressed,
                    widget.pci.getChooserMax()[index])),
            const SizedBox(
              height: 12,
            ),
          ],
        );
      }),
    ]);
  }
}
