import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/introduction_screens.dart/on_boarding_page.dart';
// import 'package:vegipak/screens/login.dart';
import 'package:vegipak/utils/routes/routes.dart';
// import '../globals.dart' as globals;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // bool _isIntroScreenShownAlready = false;
  // Future<void> checkHasViewedAlready() async {
  //   final SharedPreferences prefs = await globals.sharedPrefs;
  //   bool? isIntroScreenShownAlready =
  //       prefs.getBool("isIntroScreenShownAlready");
  //   if (isIntroScreenShownAlready != null && isIntroScreenShownAlready) {
  //     setState(() {
  //       _isIntroScreenShownAlready = true;
  //     });
  //   }
  // }

  @override
  void initState() {
    // checkHasViewedAlready();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    // );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'VegiPak',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        // home: _isIntroScreenShownAlready ? const Login() : const OnBoardingPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const OnBoardingPage(),
      ),
    );
  }
}
