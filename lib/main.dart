import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiftvote/registration/splashscreen/splashscreen.dart';
import 'package:swiftvote/registration/voter/votelink.dart';
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int hasOpened = 0;

  @override
  void initState() {
    super.initState();

    _prefs.then((SharedPreferences prefs) {
      hasOpened = prefs.getInt('splash_counter') ?? 0;
      prefs.setInt('splash_counter', hasOpened + 1);
    });
  }

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
      home: hasOpened == 0 ? const SplashScreen() : const VoteLinkPage(),
    );
  }
}
