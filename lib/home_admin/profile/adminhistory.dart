import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminHistoryPage extends StatelessWidget {
  const AdminHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SwiftVote.defAppBar("History", hasBack: true, context: context),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int i) {
              Election election = Election();
              return ListTile(
                leading: SvgPicture.asset(
                  "assets/images/defpic.svg",
                  height: 100,
                ),
                isThreeLine: true,
                title: Text(
                  election.name!,
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                      text: "${election.retype}\n${election.endDate!} \n",
                      style: TextStyle(fontFamily: 'NotoSans', fontSize: 12),
                      children: [
                        TextSpan(
                          text: "#6756hyf",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              color: Color(0xFF21A8BA),
                              fontSize: 10),
                        ),
                      ]),
                ),
              );
            }));
  }
}
