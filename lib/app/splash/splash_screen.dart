import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/custom/annotated_widget.dart';
import 'package:vegipak/app/splash/splash_provider.dart';
// import '../custom/annotated_widget.dart';
import '../components/logo_widget.dart';
import '../utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Timer? _timer;

  // void goToNextScreen() async {
  //   // final userPrefrence = Provider.of<UserProvider>(context, listen: false);
  //   // userPrefrence.getUser();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    super.initState();
    // Provider.of<SplashProvider>(context, listen: false).splashTimer(context);
    check();
  }

  void check() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: false),
    );
    final isIntroScreenShown = preferences.getBool('onBoardShown') ?? false;
    final signinCheck = await storage.read(key: 'token');

    print('isIntroScreenShown $isIntroScreenShown');
    print('signinCheck $signinCheck');

    if (!isIntroScreenShown) {
      await preferences.setBool('onBoardShown', true);

      Timer(
        const Duration(milliseconds: 2500),
        () => Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteName.onboard, (route) => false),
      );
    } else {
      if (signinCheck != null) {
        Timer(
          const Duration(milliseconds: 2500),
          () => Navigator.of(context)
              .pushNamedAndRemoveUntil(RouteName.home, (route) => false),
        );
      } else {
        Timer(
          const Duration(milliseconds: 2500),
          () => Navigator.of(context)
              .pushNamedAndRemoveUntil(RouteName.login, (route) => false),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedWidget(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logoWidget(),
            const SizedBox(height: 20),
            const SizedBox(
              height: 30.0,
              width: 30.0,
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                strokeWidth: 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _timer!.cancel();
  //   super.dispose();
  // }
}
