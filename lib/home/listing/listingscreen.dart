import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home/profilepage.dart';
import 'package:swiftvote/home/voting/voting.dart';
import 'package:swiftvote/swiftvote.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            listingHeader(h, w),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(3, (index) => positionTile("SUG"))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listingHeader(double h, double w) {
  return SizedBox(
    height: (h / 4) + 8,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: (h / 4),
          width: w,
          decoration: BoxDecoration(
            color: const Color(0xFF2C70C8),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        Positioned(
          top: 12,
          child: SvgPicture.asset(
            "assets/images/listing.svg",
            height: h / 4,
          ),
        )
      ],
    ),
  );
}

Widget positionTile(String data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Text(
                data,
                style: TextStyle(fontSize: 16),
              ),
              const Spacer(),
              const CompletedWidget(),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Wrap(
            runSpacing: 8,
            spacing: 8,
            children: List.generate(4, (index) => positionOwner())),
      ],
    ),
  );
}

Widget positionOwner() {
  return Builder(builder: (context) {
    double h = MediaQuery.of(context).size.height / 4.5;
    double w = MediaQuery.of(context).size.width / 2.5;
    return SizedBox(
      height: h,
      width: w,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ProfilePage(),
                  ),
                );
              },
              child: FlutterLogo(
                size: h * 0.6,
              ),
            ),
            Text(
              "Darlington Ezeh",
              style: TextStyle(fontSize: 11),
            ),
            Text(
              "SUG President",
              style: TextStyle(fontSize: 11, fontFamily: 'NotoSans'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const VotingPage(),
                  ),
                );
              },
              child: const Text(
                "Vote",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size?>(const Size.fromHeight(20)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(SwiftVote.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        side: const BorderSide(color: SwiftVote.primaryColor),
                        borderRadius: BorderRadius.circular(16))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16)),
              ),
            ),
          ]),
    );
  });
}
