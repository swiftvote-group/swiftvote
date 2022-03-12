import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/home_admin/adminhome.dart';
import 'package:swiftvote/registration/admin/adminsharelink.dart';
import 'package:swiftvote/registration/admin/adminsignup.dart';
import 'package:swiftvote/registration/forgotpassword/fpassword.dart';
import 'package:swiftvote/swiftvote.dart';

class AdminRegPage extends StatefulWidget {
  const AdminRegPage({Key? key}) : super(key: key);

  @override
  _AdminRegPageState createState() => _AdminRegPageState();
}

class _AdminRegPageState extends State<AdminRegPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SwiftVote.defAppBar("Admin"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                SvgPicture.asset("assets/images/adreg.svg",
                    height: MediaQuery.of(context).size.height / 3),
                const SizedBox(
                  height: 8,
                ),
                SwiftVote.signinField(
                    Icons.contact_mail_rounded, "Enter Admin ID", w),
                const SizedBox(
                  height: 8,
                ),
                SwiftVote.signinField(Icons.password_rounded, "Password", w),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const FPasswordPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Forgotten Password?",
                        style: TextStyle(
                            color: SwiftVote.primaryColor,
                            fontFamily: 'NotoSans'),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SwiftVote.defButton(context, const AdminHomePage(), "Enter",
                    isWide: true),
                const SizedBox(
                  height: 16,
                ),
                const Text.rich(TextSpan(children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.linear_scale_outlined,
                        color: Color(0xFF407BFF),
                      )),
                  TextSpan(
                      text: "  OR  ",
                      style: TextStyle(
                          color: SwiftVote.textColor,
                          fontSize: 10,
                          fontFamily: 'NotoSans')),
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.linear_scale_outlined,
                        color: Color(0xFF407BFF),
                      )),
                ])),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute<void>(
                    //     builder: (BuildContext context) => const AdminSignUp(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Sign Up",
                    style:
                        TextStyle(color: SwiftVote.primaryColor, fontSize: 16),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(24)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side:
                                const BorderSide(color: SwiftVote.primaryColor),
                            borderRadius: BorderRadius.circular(16))),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(vertical: 16)),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
