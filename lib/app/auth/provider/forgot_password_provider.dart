import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user/sign_in_model.dart';
import '../../services/user_service.dart';
import '../../utils/field_validator.dart';
import '../../utils/routes/routes_name.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final UserService _userServices = UserService();

  String? forgotEmailAddress;

  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode);

    code = submitCode;
    notifyListeners();
  }

  Future<void> getVerifyEmail() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    forgotEmailAddress = sp.getString('verifyemail') ?? '';
    notifyListeners();

    log('verify email $forgotEmailAddress');
  }

  Future<void> removeEmail() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('verifyemail');
  }

  final forgotEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final textFieldValidator = TextFieldValidators();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> forgotPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setLoading(true);
      String forgotEmail = forgotEmailController.text.trim();

      Map data = {'email': forgotEmail};

      if (forgotEmail.isNotEmpty) {
        final SharedPreferences sp = await SharedPreferences.getInstance();
        await sp.setString('verifyemail', forgotEmail);
      }

      await _userServices.forgorPassword(data).then((value) {
        if (value != null) {
          setLoading(false);

          log('value $value');

          Navigator.pushReplacementNamed(context, RouteName.forgotPasswordOtp);

          clearTextfield();
        } else {
          setLoading(false);
          return;
        }
      });
    }
  }

  void submitForgotPasswordOTP(context) {
    // print(code.length);
    if (code.length != 6) {
      // SnackBarPop.popUp(context, 'Please enter the OTP', Colors.red);
      Fluttertoast.showToast(
          msg: 'Please enter the OTP', backgroundColor: Colors.red);
    } else {
      setLoading(true);

      String email = forgotEmailAddress!;
      String otp = code;

      final VerifyOTPModel verifySignUpModel = VerifyOTPModel(
        email: email,
        otp: otp,
      );

      _userServices.verifyForgetPasswordOTP(model: verifySignUpModel).then(
        (value) {
          if (value != null) {
            setLoading(false);

            log('value $value');

            // Navigator.pushNamed(context, RouteName.forgotPasswordOtp);

            Navigator.pushReplacementNamed(context, RouteName.otpSuccess);

            removeEmail();
            // clearTextfield();
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
    forgotEmailController.clear();
    notifyListeners();
  }
}
