import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swiftvote/registration/splashscreen/splashscreen.dart';
import 'package:swiftvote/swiftvote.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await precachePicture(
    ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder, 'assets/images/sspage1.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder, 'assets/images/sspage2.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder, 'assets/images/sspage3.svg'),
    null,
  );
  await precachePicture(
    ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder, 'assets/images/fulllogow.svg'),
    null,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black.withOpacity(0),
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiftVote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SansSerifBldFLF',
        iconTheme: const IconThemeData(color: SwiftVote.textColor),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'SansSerifBldFLF',
              bodyColor: SwiftVote.textColor,
              displayColor: SwiftVote.textColor,
            ),
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
