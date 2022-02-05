import 'package:flutter/material.dart';
import 'package:swiftvote/swiftvote.dart';

class UserhistoryPage extends StatelessWidget {
  const UserhistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SwiftVote.defAppBar("History", hasBack: true, context: context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                    height: MediaQuery.of(context).size.height / 7,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        uhCat2("Jerry Dike", "Voted", isHeader: true),
                        uhCat2("SUG President", "Counted"),
                        uhCat2("15 Dec 2022", "4:50pm")
                      ],
                    ));
              }),
        ));
  }
}

Widget uhCat2(String name, String val, {isHeader = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style: TextStyle(
            fontFamily: isHeader ? "SansSerifBldFLF" : "NotoSans",
            color: isHeader ? SwiftVote.primaryColor : SwiftVote.textColor),
      ),
      Text(
        val,
        style: TextStyle(
            fontFamily: isHeader ? "SansSerifBldFLF" : "NotoSans",
            color: isHeader ? SwiftVote.primaryColor : SwiftVote.textColor),
      ),
    ],
  );
}
