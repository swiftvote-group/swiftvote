import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swiftvote/home/mainpage.dart';
import 'package:swiftvote/models/shortmodels.dart';
import 'package:swiftvote/poll_feature/poll_home.dart';
import 'package:swiftvote/registration/splashscreen/splashscreen.dart';
import 'package:swiftvote/swiftvote.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyPrefs.init();
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
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    hasOpened = MyPrefs.getDefInt("SPLASH_COUNTER") ?? 0;
    isLoggedIn = MyPrefs.isLoggedIn();
    MyPrefs.setDefInt("SPLASH_COUNTER", hasOpened + 1);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: isLoggedIn
          ? SplashLoading()
          : (hasOpened == 0
              ? const SplashScreen()
              : const SplashScreen(
                  cstate: 3,
                )),
    );
  }
}

class SplashLoading extends StatefulWidget {
  const SplashLoading({Key? key}) : super(key: key);

  @override
  State<SplashLoading> createState() => _SplashLoadingState();
}

class _SplashLoadingState extends State<SplashLoading>
    with TickerProviderStateMixin {
  Duration duration = const Duration(seconds: 1);
  bool isScreen1 = true;

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: duration)
        ..repeat(reverse: true);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // if user is in election - find user id, check if he is in an election
      Get.to(MainPage()); //
      // Get.to(PollHomePage())
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftVote.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: screen1(),
        ),
      ),
    );
  }

  Widget screen1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 0.5).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeIn)),
            child: SvgPicture.asset("assets/images/loading.svg",
                height: MediaQuery.of(context).size.height / 10)),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Loading",
          style: TextStyle(fontSize: 14, color: Colors.white),
        )
      ],
    );
  }
}
