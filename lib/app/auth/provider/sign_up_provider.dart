import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import '../../utils/field_validator.dart';
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

  String? _selectedAreaName;

  String? get selectedAreaName => _selectedAreaName;

  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final textFieldValidator = TextFieldValidators();

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

  void selectAreaName(String areaName) {
    _selectedAreaName = areaName;
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

  //   if (value.isEmpty) {
  //   return 'Phone number is required';
  // }

  // // Regular expression for the new Pakistan phone number format: 03XXXXXXXXX
  // RegExp phoneRegExp = RegExp(r'^03[0-9]{9}$');

  // if (!phoneRegExp.hasMatch(value)) {
  //   return 'Please use the format 03XXXXXXXXX';
  // }

  // return null;

  bool validatePhoneNumber(String phoneNumber) {
    // Use a regular expression to check if the phone number matches the desired format
    RegExp regExp = RegExp(r'^3\d{9}$');
    return regExp.hasMatch(phoneNumber);
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

      // final userPrefrences = Provider.of<UserProvider>(context, listen: false);

      if (email.isNotEmpty) {
        final SharedPreferences sp = await SharedPreferences.getInstance();
        await sp.setString('signUpEmailAddress', email);
      }

      _userServices.createAccount(model: signUpModel).then((value) {
        if (value != null) {
          setLoading(false);

          // userPrefrences.saveUserEmail(value);

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

    // if (phoneController.text.isEmpty) {
    //   Fluttertoast.showToast(
    //     msg: 'Phone number is required',
    //     backgroundColor: Colors.red,
    //   );
    // }
  }

  String? signUpEmailAddress;
  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode);

    code = submitCode;
    notifyListeners();
  }

  Future<void> getSignUpEmailAddress() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    signUpEmailAddress = sp.getString('signUpEmailAddress') ?? '';
    notifyListeners();

    log('verify email $signUpEmailAddress');
  }

  Future<void> removeEmail() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('signUpEmailAddress');
  }

  // Future<void> submitVerifyOTP(BuildContext context) async {
  //   if (formKey.currentState!.validate()) {
  //     formKey.currentState!.save();

  //     setLoading(true);

  //     String email = verifyEmail!;
  //     String otp = '123456';

  //     final VerifyOTPModel verifySignUpModel = VerifyOTPModel(
  //       email: email,
  //       otp: otp,
  //     );

  //     log('json ${jsonEncode(verifySignUpModel.toJson())}');

  //     final userPrefrence = Provider.of<UserProvider>(context, listen: false);

  //     _userServices.verifyAccount(model: verifySignUpModel).then((value) {
  //       if (value != null) {
  //         setLoading(false);

  //         // print('token' + value.token!);
  //         storage.write(key: 'token', value: value.token);

  //         userPrefrence.saveUser(value);

  //         Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
  //         Navigator.pushReplacementNamed(context, RouteName.home);

  //         clearTextfield();
  //       } else {
  //         setLoading(false);
  //         return;
  //       }
  //     });
  //   } else {
  //     setLoading(false);
  //   }
  // }

  void submitVerifyOTP(context) {
    // print(code.length);
    if (code.length != 6) {
      // SnackBarPop.popUp(context, 'Please enter the OTP', Colors.red);
      Fluttertoast.showToast(
          msg: 'Please enter the OTP', backgroundColor: Colors.red);
    } else {
      setLoading(true);

      String email = signUpEmailAddress!;
      String otp = code;

      final VerifyOTPModel verifySignUpModel = VerifyOTPModel(
        email: email,
        otp: otp,
      );

      final userPrefrence = Provider.of<UserProvider>(context, listen: false);

      _userServices.verifySignUpOTP(model: verifySignUpModel).then(
        (value) {
          if (value != null) {
            setLoading(false);

            log('value $value');

            storage.write(key: 'token', value: value.token);

            userPrefrence.saveUser(value);

            Provider.of<NavigationIndex>(context, listen: false).currentIndex =
                0;
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.home,
              (route) => false,
            );

            removeEmail();
          } else {
            setLoading(false);
            return;
          }
        },
      );
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
