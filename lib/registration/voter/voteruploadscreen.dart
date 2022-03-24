import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swiftvote/models/shortmodels.dart';

class VoterUploadScreen extends StatefulWidget {
  final bool isFace;
  final UserImages _userImages;
  const VoterUploadScreen(this.isFace, this._userImages, {Key? key})
      : super(key: key);

  @override
  _VoterUploadScreenState createState() => _VoterUploadScreenState();
}

class _VoterUploadScreenState extends State<VoterUploadScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? galleryImage;
  XFile? cameraImage;
  File? finalImage;

  @override
  void initState() {
    super.initState();
  }

  File? getFinalImage() {
    return widget.isFace
        ? widget._userImages.faceImage
        : widget._userImages.cardImage;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    double sH = widget.isFace ? 512 : 321.488;
    double sW = 512;
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
            height: widget.isFace ? (h - 56) / 2 : (w - 32) * 0.6279,
            width: w - 32,
            child: Card(
              elevation: 4,
              color: const Color(0xFF1E1D1D),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 4, color: Color(0xFFBDB8B8)),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  height: widget.isFace ? (h - 56) / 2 : (w - 32) * 0.6279,
                  width: w - 64,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: getFinalImage() == null
                        ? null
                        : DecorationImage(
                            image: FileImage(finalImage!), fit: BoxFit.contain),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () async {
                try {
                  galleryImage =
                      await _picker.pickImage(source: ImageSource.gallery);
                  File? file = await ImageCropper().cropImage(
                    sourcePath: galleryImage!.path,
                    aspectRatio: CropAspectRatio(ratioX: sW, ratioY: sH),
                    compressQuality: 100,
                    maxHeight: sH.round(),
                    maxWidth: sW.round(),
                    compressFormat: ImageCompressFormat.jpg,
                    iosUiSettings: const IOSUiSettings(
                      title: "Adjust Size",
                    ),
                    androidUiSettings: const AndroidUiSettings(
                      toolbarColor: Colors.white,
                      toolbarTitle: "Adjust Size",
                    ),
                  );
                  setState(() {
                    if (widget.isFace) {
                      widget._userImages.faceImage = file;
                    } else {
                      widget._userImages.cardImage = file;
                    }
                    finalImage = file;
                  });
                } catch (e) {
                  print(e);
                }
              },
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF43484B)),
                        borderRadius: BorderRadius.circular(16))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  cameraImage =
                      await _picker.pickImage(source: ImageSource.camera);
                  File? file = await ImageCropper().cropImage(
                    sourcePath: cameraImage!.path,
                    aspectRatio: CropAspectRatio(ratioX: sW, ratioY: sH),
                    compressQuality: 100,
                    maxHeight: sH.round(),
                    maxWidth: sW.round(),
                    compressFormat: ImageCompressFormat.jpg,
                    iosUiSettings: const IOSUiSettings(
                      title: "Adjust Size",
                    ),
                    androidUiSettings: const AndroidUiSettings(
                        toolbarColor: Colors.white,
                        toolbarTitle: "Adjust Size",
                        toolbarWidgetColor: Colors.white),
                  );
                  setState(() {
                    if (widget.isFace) {
                      widget._userImages.faceImage = file;
                    } else {
                      widget._userImages.cardImage = file;
                    }
                    finalImage = file;
                    // OnCapturedImage(finalImage!.path);
                  });
                } catch (e) {
                  print(e);
                }
              },
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF43484B)),
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
