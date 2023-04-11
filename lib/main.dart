import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:vegipak/app/auth/otp/provider/otp_verification_prov.dart';
import 'package:vegipak/app/auth/sign_in/view/sign_in.dart';
// import 'package:vegipak/app/auth/otp/view/otp_screen.dart';
import 'package:vegipak/app/navigation/order/provider/order_prov.dart';
import 'package:vegipak/app/welcome/onboard_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vegipak/introduction_screens.dart/on_boarding_page.dart';
// import 'package:vegipak/screens/login.dart';
import 'package:vegipak/app/utils/routes/routes.dart';
// import '../globals.dart' as globals;
import 'package:provider/provider.dart';

import 'app/auth/check_sign_in_prov.dart';
import 'app/auth/sign_in/provider/sign_in_prov.dart';
import 'app/navigation/navigation_bar/provider/index_navigation.dart';
import 'app/navigation/profile/provider/profile_provider.dart';
import 'app/navigation/vegitable/provider/vegitable_prov.dart';

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

  // @override
  // void initState() {
  //   // checkHasViewedAlready();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    // );

    return MultiProvider(
      providers: [
        //----------------
        ChangeNotifierProvider(create: (context) => SignIn()),
        ChangeNotifierProvider(create: (context) => VerifyOtpProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => NavigationIndex()),
        ChangeNotifierProvider(create: (context) => VegitableProv()),
        ChangeNotifierProvider(create: (context) => OrderProv()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: 'VegiPak',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        // home: _isIntroScreenShownAlready ? const Login() : const OnBoardingPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const LoginScreen(),
      ),
    );
  }
}
