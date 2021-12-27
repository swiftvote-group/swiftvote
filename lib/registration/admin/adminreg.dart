import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/registration/admin/adminsharelink.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/images/adreg.svg",
                    height: MediaQuery.of(context).size.height / 3),
                signinField(Icons.contact_mail_rounded, "Enter Admin ID", w),
                signinField(Icons.password_rounded, "Password", w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgotten Password?",
                      style: TextStyle(
                          color: SwiftVote.primaryColor,
                          fontFamily: 'NotoSans'),
                    ),
                  ),
                ),
                SwiftVote.defButton(context, null, "Enter"),
                Text.rich(TextSpan(children: [
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
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const AdminShareLinkPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style:
                        TextStyle(color: SwiftVote.primaryColor, fontSize: 16),
                  ),
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size?>(Size.fromHeight(24)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: SwiftVote.primaryColor),
                            borderRadius: BorderRadius.circular(16))),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(vertical: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget signinField(IconData iconData, String hint, double w) {
  return Card(
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 4,
    child: SizedBox(
      width: w,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: Icon(iconData),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 13, fontFamily: 'NotoSans'),
        ),
      ),
    ),
  );
}
