import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home/listing/listingscreen.dart';
import 'package:swiftvote/swiftvote.dart';

class ErrorPage extends StatefulWidget {
  final int errPage;
  const ErrorPage(this.errPage, {Key? key}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  List<ErrorPageItem> eps = [
    ErrorPageItem(
        "No Internet Connection",
        "Maybe it’s us, maybe it’s you - who knows? Anyway check your network connection or try again.",
        "assets/images/err_network.svg",
        "Try Again"),
    ErrorPageItem("Not Found", "Nothing like this exists in here",
        "assets/images/err_404.svg", ""),
    ErrorPageItem("Election Timeout", "Opsy! This election link has expired.",
        "assets/images/err_504.svg", "View result"),
    ErrorPageItem("No History Yet", "Why not hit the below button to vote?",
        "assets/images/err_history.svg", "Listing Page"),
  ];

  @override
  Widget build(BuildContext context) {
    ErrorPageItem ep = eps[widget.errPage];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(ep.imgUrl, height: 300),
              const SizedBox(
                height: 16,
              ),
              Text(
                ep.title,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                ep.desc,
                style: TextStyle(
                  fontFamily: 'NotoSans',
                ),
              ),
              const Spacer(),
              ep.btn == ""
                  ? SizedBox()
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ListingPage(),
                            ),
                          );
                        });
                      },
                      child: Text(ep.btn,
                          style: const TextStyle(
                              fontFamily: 'NotoSans', color: Colors.white)),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size?>(
                            const Size.fromHeight(32)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            SwiftVote.primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: SwiftVote.primaryColor),
                                    borderRadius: BorderRadius.circular(16))),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24)),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorPageItem {
  String title, desc, imgUrl, btn;
  ErrorPageItem(this.title, this.desc, this.imgUrl, this.btn);
}
