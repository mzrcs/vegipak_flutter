import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../../model/user/sign_up_model.dart';
import '../../services/user_service.dart';
import '../../navigation/navigation_bar/provider/index_navigation.dart';
import '../../utils/routes/routes_name.dart';

class SignupProvider extends ChangeNotifier {
  // String _emailError = '';
  // String _passError = '';
  // bool _isEmailValid = true;
  // bool _isPassValid = true;

  // // getters
  // String get emailError => _emailError;
  // String get passError => _passError;
  // bool get isEmailValid => _isEmailValid;
  // bool get isPassValid => _isPassValid;

  // void validateEmail(String? email) {
  //   // email validation logic
  //   // _isEmailValid = _email.contains('@') && _email.contains('.');
  //   if (email!.isEmpty) {
  //     _emailError = 'Please enter your email address';
  //   }
  //   if (email.isNotEmpty) {
  //     _isEmailValid = !isEmail(email);
  //     _emailError = 'Enter a valid email address';
  //   }
  //   _isEmailValid = isEmail(email);
  //   notifyListeners();
  // }

  // void validatePass(String? password) {
  //   // email validation logic
  //   if (password!.isEmpty) {
  //     _passError = 'Please enter passowrd';
  //   } else if (password.length < 8) {
  //     _passError = 'Password minimum 8 characters';
  //   } else if (password.isNotEmpty || password.length >= 8) {
  //     _isPassValid = !isValidPassword(password);
  //     _passError = ' Password must include number and special characters';
  //   }
  //   _isPassValid = isValidPassword(password);
  //   notifyListeners();
  // }

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
  UserService userServices = UserService();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signUp(BuildContext context) {
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
        areaId: 1,
        address: address,
        password: password,
        status: true,
      );

      userServices.createAccount(model: signUpModel).then((value) {
        if (value != null) {
          setLoading(false);

          storage.write(key: 'token', value: value.token);
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
