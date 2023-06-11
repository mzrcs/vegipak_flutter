import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user/token.dart';

class UserProvider extends ChangeNotifier {
  String? fullName;
  String? email;

  //----------------- Get to Preferences
  Future<void> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    fullName =
        ('${sp.getString('first_name') ?? ''} ${sp.getString('last_name') ?? ''}');
    notifyListeners();

    print(fullName);
    print(email);
  }

  //----------------- Save to Preferences
  Future<void> saveUser(AuthModel authModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('first_name', authModel.firstName.toString());
    sp.setString('last_name', authModel.lastName.toString());
    sp.setString('email', authModel.email.toString());
    notifyListeners();
  }

  //----------------- Remove to Preferences
  Future<void> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('first_name');
    sp.remove('last_name');
    sp.remove('email');
  }
}
