import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftvote/registration/admin/adminreg.dart';
import 'package:swiftvote/registration/voter/signin.dart';
import 'package:swiftvote/registration/voter/user/signup.dart';
import 'package:swiftvote/swiftvote.dart';

class ChooseUserPage extends StatefulWidget {
  final bool isCreate;
  const ChooseUserPage(this.isCreate, {Key? key}) : super(key: key);

  @override
  State<ChooseUserPage> createState() => _ChooseUserPageState();
}

class _ChooseUserPageState extends State<ChooseUserPage> {
  List<String> titles = ["Voter", "Administrator"];
  List<String> titleImages = ["voter.png", "admin.png"];
  int _curUser = 0;

  // List<Widget> screens = []

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const SizedBox(
            height: 56,
          ),
          Text(
              "Which user do you want to ${widget.isCreate ? "Sign Up" : "Sign In"} as",
              style: TextStyle(fontSize: 16)),
          const SizedBox(
            height: 56,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [userCard(0), userCard(1)],
          ),
          const Spacer(),
          SwiftVote.defButton(context, null, "Take me there",
              isWide: true, shdStay: true, func: () {
            Widget? s;
            if (widget.isCreate) {
              if (_curUser == 0) {
                s = const SignUpPage();
              } else {
                //show snackbar
              }
            } else {
              if (_curUser == 0) {
                s = const SignInPage();
              } else {
                s = const AdminRegPage();
              }
            }
            if (s != null) {
              Get.to(s);
            }
          }),
          const SizedBox(
            height: 56,
          ),
        ]),
      ),
    );
  }

  Widget userCard(int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _curUser = i;
        });
      },
      child: Container(
        width: Get.width / 2 - 56,
        height: Get.width / 2 - 56,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 3,
                color: _curUser == i
                    ? SwiftVote.primaryColor
                    : Color(0xFFEEF5FE))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/${titleImages[i]}",
                width: 64, height: 64),
            Text(
              titles[i],
              style: TextStyle(color: SwiftVote.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
