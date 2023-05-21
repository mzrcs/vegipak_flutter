import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/model/user/token.dart';
import 'package:vegipak/app/services/user_service.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';
import '../../model/user/sign_in_model.dart';
import '../../navigation/navigation_bar/provider/index_navigation.dart';

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

bool isValidPassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

class LoginProvider extends ChangeNotifier {
  //--------------------- Visibility (password)
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

  UserService userServices = UserService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signIn(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setLoading(true);

      final SignInModel signinModel = SignInModel(
        email: emailController.text,
        password: passwordController.text,
      );

      userServices.signinUser(model: signinModel).then((value) {
        if (value != null) {
          setLoading(false);

          storage.write(key: 'token', value: value.token);
          saveUser(value);

          Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
          Navigator.pushReplacementNamed(context, RouteName.home);

          clearTextfield();
        } else {
          setLoading(false);
          return;
        }
      });
    }
  }

  //----------------- Save to Preferences
  Future<void> saveUser(AuthModel authModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('first_name', authModel.firstName.toString());
    sp.setString('last_name', authModel.lastName.toString());
    sp.setString('email', authModel.email.toString());
    notifyListeners();
  }

  //----------------- Clear Textformfield
  void clearTextfield() {
    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }
}