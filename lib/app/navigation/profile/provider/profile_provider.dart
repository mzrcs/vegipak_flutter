// import 'dart:developer';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/model/user/sign_in_model.dart';
import '../../../auth/provider/user_provider.dart';
import '../../../model/user/token.dart';
import '../../../model/user/user_model.dart';
import '../../../services/user_service.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider(context) {
    getSavedData(context);
  }

  AuthModel authModel = AuthModel(uId: 4);

  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _loading2 = false;
  bool get isLoading2 => _loading2;

  setLoading2(bool value) {
    _loading2 = value;
    notifyListeners();
  }

  resetLoading() {
    if (_loading2 == true) {
      _loading2 = false;
      // notifyListeners();
    }
    clearTextfield();
  }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserModel userModel = UserModel();

  Future<void> getSavedData(context) async {
    setLoading(true);
    final userPrefrence = Provider.of<UserProvider>(context, listen: false);
    await userPrefrence.getSaveUser(userModel);
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      firstNameController.text = userModel.firstName;
      lastNameController.text = userModel.lastName;
      emailController.text = userModel.email;
      phoneController.text = userModel.phone;
      setLoading(false);
    });
  }

  // void updateMyProfile(BuildContext context) {
  //   if (formKey.currentState!.validate()) {
  //     formKey.currentState!.save();

  //     setLoading(true);

  //     // final SignInModel signinModel = SignInModel(
  //     //   email: emailController.text,
  //     //   password: passwordController.text,
  //     // );

  //     userServices.signinUser(model: signinModel).then((value) {
  //       if (value != null) {
  //         setLoading(false);

  //         storage.write(key: 'token', value: value.token);
  //         saveUser(value);

  //         Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
  //         Navigator.pushReplacementNamed(context, RouteName.home);

  //         clearTextfield();
  //       } else {
  //         setLoading(false);
  //         return;
  //       }
  //     });
  //   }
  // }

  final UserService _userServices = UserService();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  Future<void> updatePassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setLoading2(true);

      // String oldPassword = oldPasswordController.text.trim();
      // String newPassword = newPasswordController.text.trim();

      final UpdatePasswordModel updatePasswordModel = UpdatePasswordModel(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
      );

      // print(jsonEncode(updatePasswordModel.toJson()));

      await _userServices.updatePassword(model: updatePasswordModel).then(
        (value) {
          log('value $value');
          if (value != null) {
            setLoading2(false);

            Utils.snackBarPopUp(context,
                'Password has been changed successfully.', Colors.green);
            Navigator.pop(context);

            clearTextfield();
          } else {
            log('else $value');
            setLoading2(false);
            return;
          }
        },
      );
    }
  }

  void logOut(context) async {
    final userPrefrence = Provider.of<UserProvider>(context, listen: false);

    await storage.delete(key: 'token');
    userPrefrence.remove();

    Navigator.pushNamedAndRemoveUntil(
        context, RouteName.login, (route) => false);
    notifyListeners();
  }

  //----------------- Clear Textformfield
  void clearTextfield() {
    oldPasswordController.clear();
    newPasswordController.clear();
    notifyListeners();
  }
}
