import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../../navigation/navigation_bar/provider/index_navigation.dart';
import '../../../navigation/navigation_bar/view/navigation_bar.dart';
import '../../../services/sign_in_service.dart';
// import '../../../utils/routes/routes_name.dart';
import '../model/sign_in_model.dart';

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

class SignIn extends ChangeNotifier {
  String _emailError = '';
  String _passError = '';
  bool _isEmailValid = true;
  bool _isPassValid = true;

  // getters
  String get emailError => _emailError;
  String get passError => _passError;
  bool get isEmailValid => _isEmailValid;
  bool get isPassValid => _isPassValid;

  void validateEmail(String? email) {
    // email validation logic
    // _isEmailValid = _email.contains('@') && _email.contains('.');
    if (email!.isEmpty) {
      _emailError = 'Please enter your email address';
    }
    if (email.isNotEmpty) {
      _isEmailValid = !isEmail(email);
      _emailError = 'Enter a valid email address';
    }
    _isEmailValid = isEmail(email);
    notifyListeners();
  }

  void validatePass(String? password) {
    // email validation logic
    if (password!.isEmpty) {
      _passError = 'Please enter passowrd';
    } else if (password.length < 8) {
      _passError = 'Password minimum 8 characters';
    } else if (password.isNotEmpty || password.length >= 8) {
      _isPassValid = !isValidPassword(password);
      _passError = ' Password must include number and special characters';
    }
    _isPassValid = isValidPassword(password);
    notifyListeners();
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

  // final TextEditingController email = TextEditingController();

  // String? emailValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'This is required';
  //   } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
  //     return "Please enter a valid email address";
  //   } else {
  //     return null;
  //   }
  // }

  // final TextEditingController password = TextEditingController();

  // String? passwordValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'This is required';
  //   } else if (value.length < 3) {
  //     return 'Should contain minimum of 4 letters';
  //   } else {
  //     return null;
  //   }
  // }

  FlutterSecureStorage storage = const FlutterSecureStorage();
  SigninServices signinServices = SigninServices();
  // bool isLoading = false;
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signIn(
    BuildContext context,
    TextEditingController email,
    TextEditingController password,
  ) async {
    setLoading(true);

    final SignInModel signinModel = SignInModel(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    signinServices.signinUser(signinModel, context).then((value) {
      if (value != null) {
        storage.write(key: 'token', value: value.accessToken);
        notifyListeners();
        Future.delayed(const Duration(seconds: 3)).then((value) {
          setLoading(false);
          Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BottomNavigationScreen(),
          ));
          // Navigator.pushNamed(context, RouteName.home);
          clearTextfield(email, password);
        });
      } else {
        setLoading(false);
      }
    });
    // setLoading(false);
  }

  // void checkSignIn(BuildContext context) {
  //   if (_isEmailValid || _isPassValid) {
  //     signIn(context);
  //     // print('EmailValidate: $isEmailValid');
  //     // print('PassValidate: $isPassValid');
  //   }
  // }

  //----------------- Clear Textformfield
  void clearTextfield(
    TextEditingController email,
    TextEditingController password,
  ) {
    email.clear();
    password.clear();
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}
