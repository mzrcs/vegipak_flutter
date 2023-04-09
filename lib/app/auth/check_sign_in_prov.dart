import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';

import '../navigation/navigation_bar/view/navigation_bar.dart';

class SplashProvider extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signinCheck;

  void splashTimer(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () async {
        signinCheck = await storage.read(key: 'token');
        log(signinCheck.toString());
        if (signinCheck != null) {
          log('splash');
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return const BottomNavigationScreen();
            },
          ), (route) => false);
        } else {
          if (signinCheck == null) {
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            //   builder: (context) {
            //     return const SignInScreen();
            //   },
            // ), (route) => false);
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.login,
              (route) => false,
            );
          }
        }
      },
    );
  }
}
