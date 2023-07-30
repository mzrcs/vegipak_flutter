import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/model/user/user_model.dart';
import '../../model/user/token.dart';

class UserProvider extends ChangeNotifier {
  int? id;
  String? fullName;
  String? email;
  String? phone;

  //----------------- Get to Preferences
  Future<void> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    id = sp.getInt('id');
    email = sp.getString('email') ?? '';
    fullName =
        ('${sp.getString('first_name') ?? ''} ${sp.getString('last_name') ?? ''}');
    phone = sp.getString('phone') ?? '';

    notifyListeners();

    // print(id);
    // print(fullName);
    // print(email);
    // print(phone);
  }

  Future<void> getSaveUser(UserModel userModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    userModel.id = sp.getInt('id') ?? 0;
    userModel.firstName = sp.getString('first_name') ?? '';
    userModel.lastName = sp.getString('last_name') ?? '';
    userModel.email = sp.getString('email') ?? '';
    userModel.phone = sp.getString('phone') ?? '';
    userModel.address = sp.getString('address') ?? '';
    userModel.districtAreaId = sp.getInt('areaId') ?? 0;
    notifyListeners();
  }

  //----------------- Save to Preferences
  Future<void> saveUser(AuthModel authModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('id', authModel.uId);
    sp.setString('first_name', authModel.firstName.toString());
    sp.setString('last_name', authModel.lastName.toString());
    sp.setString('email', authModel.email.toString());
    sp.setString('phone', authModel.phone.toString());
    sp.setString('address', authModel.address.toString());
    sp.setInt('areaId', authModel.districtAreaId!);
    notifyListeners();
  }

  Future<void> saveUserEmail(SignUpAuthModel signUpAuthModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('registerEmail', signUpAuthModel.userEmail.toString());
    notifyListeners();
  }

  //----------------- Remove to Preferences
  Future<void> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('id');
    sp.remove('first_name');
    sp.remove('last_name');
    sp.remove('email');
    sp.remove('phone');
    sp.remove('address');
    sp.remove('areaId');
  }
}
