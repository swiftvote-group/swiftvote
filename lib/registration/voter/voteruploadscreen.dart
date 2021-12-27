import 'package:flutter/material.dart';

class VoterUploadScreen extends StatefulWidget {
  const VoterUploadScreen({Key? key}) : super(key: key);

  @override
  _VoterUploadScreenState createState() => _VoterUploadScreenState();
}

class _VoterUploadScreenState extends State<VoterUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.camera_alt_outlined,
          color: const Color(0xFF43484B),
          size: 48,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 4,
              color: Color(0xFF1E1D1D),
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 4, color: Color(0xFFBDB8B8)),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  height: (MediaQuery.of(context).size.height / 3),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 2, color: Color(0xFF3E3B3B)),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Text(
          "Upload a picture of your student ID card to ensure authenticity.",
          style: TextStyle(fontSize: 8),
        ),
        SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                  Icons.file_upload_outlined,
                  color: const Color(0xFF43484B),
                )),
                TextSpan(
                    text: "    Upload",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF43484B)))
              ])),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        side: BorderSide(color: const Color(0xFF43484B)),
                        borderRadius: BorderRadius.circular(16))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                  Icons.add_a_photo_outlined,
                  color: const Color(0xFF43484B),
                )),
                TextSpan(
                    text: "   Capture",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF43484B)))
              ])),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        side: BorderSide(color: const Color(0xFF43484B)),
                        borderRadius: BorderRadius.circular(16))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
