import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/auth/provider/user_provider.dart';
import 'package:vegipak/app/model/user/sign_in_model.dart';
// import 'package:vegipak/app/model/user/token.dart';
// import 'package:vegipak/app/auth/provider/user_provider.dart';
// import 'package:vegipak/app/auth/provider/user_provider.dart';
import '../../model/user/area_model.dart';
import '../../model/user/sign_up_model.dart';
import '../../navigation/navigation_bar/provider/index_navigation.dart';
import '../../services/user_service.dart';
import '../../utils/routes/routes_name.dart';
// import '../../navigation/navigation_bar/provider/index_navigation.dart';
// import '../../utils/routes/routes_name.dart';

class SignupProvider extends ChangeNotifier {
  SignupProvider(context) {
    getDistrictArea();
  }

  //---------------------------*Visibility (password)
  bool isobscure = true;
  Icon icon = const Icon(
    Icons.visibility_off,
  );

  void visibility() {
    if (isobscure == false) {
      icon = const Icon(
        Icons.visibility_off,
      );
      isobscure = true;
      notifyListeners();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: Colors.black,
      );
      isobscure = false;
      notifyListeners();
    }
  }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  final UserService _userServices = UserService();

  List<DistrictAreas> districtAreaList = [];

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  int? selectedAreaId;
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _areaLoading = false;
  bool get areaLoading => _areaLoading;

  setAreaLoading(bool value) {
    _areaLoading = value;
    notifyListeners();
  }

  selectAreaId(int value) {
    selectedAreaId = value;
    notifyListeners();
  }

  Future getDistrictArea() async {
    // log("message");
    setAreaLoading(true);
    await _userServices.districtAreas().then((value) {
      if (value != null) {
        // print(value.districtAreas);
        districtAreaList = value.districtAreas!;
        notifyListeners();

        setAreaLoading(false);
      } else {
        setAreaLoading(false);
        return null;
      }
    });

    // log('districtAreaList ${districtAreaList}');
  }

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setLoading(true);
      String userType = 'customer';
      String firstName = firstNameController.text.trim();
      String lastName = lastNameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      String address = addressController.text.trim();

      final SignUpModel signUpModel = SignUpModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        userType: userType,
        phone: phone,
        areaId: selectedAreaId!,
        address: address,
        password: password,
        status: true,
      );

      log('json ${jsonEncode(signUpModel.toJson())}');

      final userPrefrences = Provider.of<UserProvider>(context, listen: false);

      _userServices.createAccount(model: signUpModel).then((value) {
        if (value != null) {
          setLoading(false);

          userPrefrences.saveUserEmail(value);

          // Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
          Navigator.pushReplacementNamed(context, RouteName.otp);

          clearTextfield();
        } else {
          setLoading(false);
          return;
        }
      });
    } else {
      setLoading(false);
    }
  }

  String? verifyEmail;

  Future<void> getVerifiyEmail() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    verifyEmail = sp.getString('registerEmail') ?? '';
    notifyListeners();

    log('verifyEmail $verifyEmail');
  }

  Future<void> verifyOTP(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setLoading(true);

      String email = verifyEmail!;
      String otp = '123456';

      final VerifyOTPModel verifySignUpModel = VerifyOTPModel(
        email: email,
        otp: otp,
      );

      log('json ${jsonEncode(verifySignUpModel.toJson())}');

      final userPrefrence = Provider.of<UserProvider>(context, listen: false);

      _userServices.verifyAccount(model: verifySignUpModel).then((value) {
        if (value != null) {
          setLoading(false);

          // print('token' + value.token!);
          storage.write(key: 'token', value: value.token);

          userPrefrence.saveUser(value);

          Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
          Navigator.pushReplacementNamed(context, RouteName.home);

          clearTextfield();
        } else {
          setLoading(false);
          return;
        }
      });
    } else {
      setLoading(false);
    }
  }

  //----------------- Clear Textformfield
  void clearTextfield() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    passwordController.clear();
    notifyListeners();
  }
}
