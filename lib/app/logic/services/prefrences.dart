import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/darta/models/user/sign_in_token.dart';

class UserDetails {
  String? token;
  // String? password;

  UserDetails({this.token});
}

class Preferences {
  static Future<void> saveUserDetails(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    // await prefs.setString("password", password);
    log("User details saved!");
  }

  static Future<UserDetails> fetchUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    // print('token $token');
    // String? password = prefs.getString("password");

    return UserDetails(token: token);
  }

  static Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    log("Preferences cleared!");
  }
}
