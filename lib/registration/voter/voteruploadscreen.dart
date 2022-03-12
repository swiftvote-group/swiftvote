import 'package:flutter/material.dart';

class VoterUploadScreen extends StatefulWidget {
  final bool isFace;
  const VoterUploadScreen(this.isFace, {Key? key}) : super(key: key);

  @override
  _VoterUploadScreenState createState() => _VoterUploadScreenState();
}

class _VoterUploadScreenState extends State<VoterUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Icon(
            widget.isFace
                ? Icons.tag_faces_outlined
                : Icons.camera_alt_outlined,
            color: const Color(0xFF43484B),
            size: 32,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: (MediaQuery.of(context).size.height - 56) / 2,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 4,
              color: const Color(0xFF1E1D1D),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 4, color: Color(0xFFBDB8B8)),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  height: (MediaQuery.of(context).size.height - 56) / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border:
                        Border.all(width: 2, color: const Color(0xFF3E3B3B)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text.rich(TextSpan(
            text: widget.isFace ? "Scan your" : "Upload a picture of your",
            style: const TextStyle(
                fontSize: 10, color: Color(0xFF494848), fontFamily: 'NotoSans'),
            children: [
              TextSpan(
                text: widget.isFace ? " face" : " student ID card",
                style: const TextStyle(color: Colors.red),
              ),
              TextSpan(
                text: widget.isFace
                    ? " for proper record keeping and authenticity"
                    : " to ensure authenticity.",
              )
            ])),
        const SizedBox(
          height: 32,
        ),
        widget.isFace
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text.rich(TextSpan(children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.file_upload_outlined,
                            color: Color(0xFF43484B),
                          )),
                      TextSpan(
                          text: "    Upload",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF43484B)))
                    ])),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF43484B)),
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text.rich(TextSpan(children: [
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Color(0xFF43484B),
                          )),
                      TextSpan(
                          text: "   Capture",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF43484B)))
                    ])),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF43484B)),
                              borderRadius: BorderRadius.circular(16))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24)),
                    ),
                  ),
                ],
              )
      ],
    );
  }
}
