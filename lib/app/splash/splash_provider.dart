import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';

class SplashProvider extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: false),
  );
  // String? onboardValue;
  String? signinCheck;
  String? email;
  bool isIntroScreenShown = false;

  void splashTimer(BuildContext context) {
    final router = Navigator.of(context);
    Timer(
      const Duration(seconds: 2),
      () async {
        final SharedPreferences sp = await SharedPreferences.getInstance();
        email = sp.getString('email');
        isIntroScreenShown = sp.getBool('onboard') ?? false;
        signinCheck = await storage.read(key: 'token');

        print('signinCheck: ' + signinCheck.toString());
        // print('isIntroScreenShown $isIntroScreenShown');

        // print('email ' + email.toString());
        if (signinCheck != null) {
          router.pushNamedAndRemoveUntil(RouteName.home, (route) => false);
        } else {
          if (signinCheck == null) {
            print('isIntroScreenShown else $isIntroScreenShown');
            if (!isIntroScreenShown) {
              print('show on board screen!');
              await sp.setBool('onboard', true);

              router.pushNamedAndRemoveUntil(
                RouteName.onboard,
                (route) => false,
              );
            } else {
              router.pushNamedAndRemoveUntil(RouteName.login, (route) => false);
            }
          }
        }
      },
    );
  }
}
