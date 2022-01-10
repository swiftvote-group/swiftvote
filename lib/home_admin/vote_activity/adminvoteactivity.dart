import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminVoteActivity extends StatefulWidget {
  const AdminVoteActivity({Key? key}) : super(key: key);

  @override
  _AdminVoteActivityState createState() => _AdminVoteActivityState();
}

class _AdminVoteActivityState extends State<AdminVoteActivity> {
  int curPos = 0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8),
              padding:
                  const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              decoration: const BoxDecoration(
                  color: SwiftVote.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4))),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        15,
                        (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                curPos = index;
                              });
                            },
                            child: positionTab("SUG", curPos == index)))),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    8,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SwiftVote.livePollUser(),
                        )),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Table(
                    border: const TableBorder(
                      top: BorderSide(color: Color(0xFFDADADA)),
                      left: BorderSide(color: Color(0xFFDADADA)),
                      right: BorderSide(color: Color(0xFFDADADA)),
                      bottom: BorderSide(color: Color(0xFFDADADA)),
                      horizontalInside:
                          BorderSide(color: Color(0xFFDADADA), width: 2),
                      verticalInside:
                          BorderSide(color: Color(0xFFDADADA), width: 2),
                    ),
                    defaultColumnWidth: FixedColumnWidth(0.2 * w),
                    columnWidths: const {0: FixedColumnWidth(32)},
                    children: [
                      TableRow(
                          children: List.generate(
                              10,
                              (j) => Container(
                                    color: Colors.lightBlueAccent,
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          fontFamily: 'NotoSans',
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                      ...List.generate(
                          50,
                          (i) => TableRow(
                              children: List.generate(
                                  10,
                                  (j) => Container(
                                        color: Colors.redAccent,
                                        child: Text(
                                          "Voted",
                                          style: TextStyle(
                                              fontFamily: 'NotoSans',
                                              fontSize: 11),
                                        ),
                                      ))))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget positionTab(String data, bool isSelected) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        data,
        style: const TextStyle(fontFamily: 'NotoSans', color: Colors.white),
      ),
      const SizedBox(
        height: 4,
      ),
      Container(
        height: isSelected ? 3 : 1,
        width: 32,
        decoration: BoxDecoration(
          borderRadius: isSelected ? BorderRadius.circular(4) : null,
          color: isSelected ? const Color(0xFFADC6FF) : const Color(0xFF164B90),
        ),
      )
    ],
  );
}
