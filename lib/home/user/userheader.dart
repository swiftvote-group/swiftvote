import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

class UserHeaderPage extends StatelessWidget {
  const UserHeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4 - 56,
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: SwiftVote.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Terry Isife",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "onyebuchiterry@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const Spacer(),
          Row(children: [
            Expanded(child: uhCat("Reg", "2016/123456", "Faculty", "Eng")),
            Expanded(
                child: uhCat("Level", "100L", "Department", "Microbiology")),
          ])
        ],
      ),
    );
  }
}

Widget uhCat(String name1, String val1, String name2, String val2) {
  return Container(
    margin: EdgeInsets.all(4),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Color(0xFF225EAD),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(mainAxisSize: MainAxisSize.max, children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name1,
              style: TextStyle(color: Colors.white, fontFamily: 'NotoSans')),
          const SizedBox(
            height: 8,
          ),
          Text(
            val1,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSans'),
          ),
        ],
      ),
      const Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name2,
              style: TextStyle(color: Colors.white, fontFamily: 'NotoSans')),
          const SizedBox(
            height: 8,
          ),
          Text(
            val2,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSans'),
          ),
        ],
      ),
    ]),
  );
}
