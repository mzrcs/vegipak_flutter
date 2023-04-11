import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vegipak/app/auth/sign_in/provider/sign_in_prov.dart';

import '../../../auth/sign_in/view/sign_in.dart';
// import '../../../utils/routes/routes_name.dart';

class ProfileProvider extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void logout(BuildContext context) async {
    setLoading(true);
    await storage.delete(key: 'token');
    Future.delayed(const Duration(seconds: 3)).then((value) {
      setLoading(false);
      // Navigator.pushNamed(context, RouteName.login);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ), (route) => false);
    });
    // setLoading(false);
  }

  void logOut(context) async {
    setLoading(true);
    await storage.delete(key: 'token');
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
      setLoading(false);
    });
    notifyListeners();
  }
}
