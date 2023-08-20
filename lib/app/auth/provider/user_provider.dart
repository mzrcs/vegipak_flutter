// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/model/general/general_model.dart';
import 'package:vegipak/app/model/user/user_model.dart';
import 'package:vegipak/app/services/user_service.dart';
import '../../model/user/token.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userServices = UserService();

  List<GeneralModel> generalSettingList = [];
  String? businessPhone;
  String? businessSupportEmail;

  Future<void> getGeneralSetting() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    // log("getGeneralSetting");

    await _userServices.generalSetting().then((value) async {
      if (value != null) {
        generalSettingList = value.generalSetting!;
        for (var item in generalSettingList) {
          if (item.key == 'ivr_phone') {
            // log('Value ${item.value}');
            await sp.setString('businessPhone', item.value.toString());
          } else if (item.key == 'contact_email') {
            // log('Value ${item.value}');
            await sp.setString('businessEmail', item.value.toString());
          }
        }
        businessPhone = sp.getString('businessPhone') ?? '123456789';
        businessSupportEmail =
            sp.getString('businessEmail') ?? 'supportFake@vegipak.com';

        // log('businessPhone $businessPhone');
        // log('businessSupportEmail $businessSupportEmail');

        notifyListeners();
      } else {
        return null;
      }
    });
  }

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
    userModel.status = sp.getInt('status') ?? 0;
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
    sp.setInt('status', authModel.status!);
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
    sp.remove('status');
    sp.remove('businessPhone');
    sp.remove('businessEmail');
  }
}
