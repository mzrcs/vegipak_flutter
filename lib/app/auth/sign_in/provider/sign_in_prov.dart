import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../../navigation/navigation_bar/provider/index_navigation.dart';
import '../../../navigation/navigation_bar/view/navigation_bar.dart';
import '../../../services/sign_in_service.dart';
// import '../../../utils/routes/routes_name.dart';
import '../model/sign_in_model.dart';

class SignIn extends ChangeNotifier {
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

  final TextEditingController email = TextEditingController();

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This is required';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  final TextEditingController password = TextEditingController();

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This is required';
    } else if (value.length < 3) {
      return 'Should contain minimum of 4 letters';
    } else {
      return null;
    }
  }

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

  // void signIn(BuildContext context) {
  //   if (formGlobalKey.currentState!.validate()) {
  //     formGlobalKey.currentState!.save();
  //     //---
  //     setLoading(true);

  //     final SignInModel signinModel = SignInModel(
  //       email: email.text,
  //       password: password.text,
  //     );

  //     signinServices.signinUser(signinModel, context).then(
  //       (value) {
  //         if (value != null) {
  //           log("write =${value.accessToken}");
  //           storage.write(key: 'token', value: value.accessToken);
  //           // storage.write(key: 'refreshToken', value: value.refreshToken);
  //           notifyListeners();
  //           storage.read(key: 'token').then((value) {
  //             if (value != null) {
  //               log('read =$value');
  //             }
  //           });
  //           // Provider.of<NavigationIndex>(context, listen: false).currentIndex =
  //           //     0;
  //           // Navigator.of(context).push(MaterialPageRoute(
  //           //   builder: (context) => const BottomNavigationScreen(),
  //           // ));
  //           setLoading(false);

  //           Navigator.pushNamed(context, RouteName.home);

  //           //---
  //           clearTextfield();
  //         } else {
  //           return;
  //         }
  //       },
  //     );
  //     setLoading(false);
  //   }
  // }

  void signIn(BuildContext context) async {
    setLoading(true);

    final SignInModel signinModel = SignInModel(
      email: email.text,
      password: password.text,
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
          clearTextfield();
        });
      } else {
        setLoading(false);
      }
    });
    // setLoading(false);
  }

  //---------------------------*Clear Textformfield
  void clearTextfield() {
    email.clear();
    password.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
