import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/registration/splashscreen/splashscreen.dart';
import 'package:swiftvote/registration/voter/votelink.dart';
import 'package:swiftvote/swiftvote.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyPrefs.init();
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
  runApp(ChangeNotifierProvider(
    create: (_) => MyNotif(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int hasOpened = 0;

  @override
  void initState() {
    super.initState();

    hasOpened = MyPrefs.getDefInt("SPLASH_COUNTER") ?? 0;
    MyPrefs.setDefInt("SPLASH_COUNTER", hasOpened + 1);
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
      home: hasOpened == 0
          ? const SplashScreen()
          : const SplashScreen(
              cstate: 3,
            ),
    );
  }
}
