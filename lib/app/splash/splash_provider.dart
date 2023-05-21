import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';

class SplashProvider extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  // String? onboardValue;
  String? signinCheck;
  String? email;

  void splashTimer(BuildContext context) {
    final router = Navigator.of(context);
    Timer(
      const Duration(seconds: 2),
      () async {
        signinCheck = await storage.read(key: 'token');

        final SharedPreferences sp = await SharedPreferences.getInstance();
        email = sp.getString('email');

        print(signinCheck.toString());
        print('email ' + email.toString());
        if (signinCheck != null) {
          print('splash');
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          //   builder: (context) {
          //     return const BottomNavigationScreen();
          //   },
          // ), (route) => false);
          router.pushNamedAndRemoveUntil(RouteName.home, (route) => false);
        } else {
          if (signinCheck == null) {
            router.pushNamedAndRemoveUntil(RouteName.login, (route) => false);
          }
        }
      },
    );
  }
}
