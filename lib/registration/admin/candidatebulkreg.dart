import 'package:flutter/material.dart';
import 'package:swiftvote/home/positionpage.dart';
import 'package:swiftvote/swiftvote.dart';

class CandBulkRegPage extends StatefulWidget {
  const CandBulkRegPage({Key? key}) : super(key: key);

  @override
  _CandBulkRegPageState createState() => _CandBulkRegPageState();
}

class _CandBulkRegPageState extends State<CandBulkRegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: SwiftVote.textColor,
              )),
          centerTitle: true,
          title: Text(
            "Admin",
            style: const TextStyle(fontSize: 20, color: SwiftVote.textColor),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
              child: Container(
                color: const Color(0xFF726F6F),
                height: 1.0,
              ),
              preferredSize: const Size.fromHeight(1.0)),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height - 56,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Register candidates",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add list of candidates",
                      style: TextStyle(
                          color: SwiftVote.textColor,
                          fontFamily: 'NotoSans',
                          fontSize: 10),
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: Color(0xFF22272E),
                              size: 48,
                            ),
                            Text(
                              "Upload a spreadsheet file to register candidates",
                              style: TextStyle(
                                  color: SwiftVote.textColor,
                                  fontFamily: 'NotoSans',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Browse File",
                                style: const TextStyle(
                                    color: SwiftVote.primaryColor,
                                    fontSize: 16),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFDCDFE1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: SwiftVote.primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(16))),
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 48)),
                              ),
                            )
                          ])),
                  SwiftVote.defButton(
                      context, null, "Download spreadsheet template",
                      bcolor: const Color(0xFF0BCE43), isWide: true),
                  SwiftVote.defButton(
                      context, null, "Download spreadsheet example",
                      bcolor: const Color(0xFFCE170B), isWide: true),
                  SwiftVote.defButton(context, null, "Documetation",
                      bcolor: const Color(0xFF1A549F), isWide: true),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SwiftVote.defButton(
                          context, const PositionPage(), "Next"))
                ]),
          ),
        )));
  }
}