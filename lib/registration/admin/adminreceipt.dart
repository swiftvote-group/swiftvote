import 'package:flutter/material.dart';
import 'package:swiftvote/home_admin/adminhome.dart';
import 'package:swiftvote/registration/voter/voter.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminReceiptPage extends StatelessWidget {
  AdminReceiptPage({Key? key}) : super(key: key);

  final List<String> data = [
    "Admin",
    "6",
    "",
    "Voters",
    "23,158",
    "N41,685",
    "Candidates",
    "28",
    "N50",
    "Electoral System",
    "f-p-t-p",
    "",
    "Poll Access",
    "Open",
    "",
    "Time",
    "24hrs",
    "free",
    "Data display",
    "6",
    "N1,500"
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SwiftVote.defAppBar("Admin"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 0.6 * h,
                width: w,
                child: Column(
                  children: [
                    SwiftVote.uniHeader(),
                    const Spacer(),
                    Table(
                      columnWidths: {
                        0: FixedColumnWidth(w / 3),
                        1: FixedColumnWidth(0.2 * w),
                        2: FixedColumnWidth(0.2 * w),
                      },
                      children: List.generate(
                          7,
                          (index) => defRow(
                              data.sublist(0 + (index * 3), 3 + (index * 3)))),
                    ),
                    const Spacer(),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.0),
                          child: Text("Total: N42,535"),
                        )),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Make Changes",
                        style: TextStyle(
                            color: SwiftVote.primaryColor, fontSize: 16),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFDCDFE1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: SwiftVote.primaryColor),
                                    borderRadius: BorderRadius.circular(16))),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 48)),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SwiftVote.defButton(
                context, const AdminHomePage(), "Host this election"),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

TableRow defRow(List<String> data) {
  return TableRow(
    children: List.generate(
      data.length,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          data[index],
          style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 11,
              fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
              fontStyle: index == 0 ? FontStyle.normal : FontStyle.italic),
        ),
      ),
    ),
  );
}
