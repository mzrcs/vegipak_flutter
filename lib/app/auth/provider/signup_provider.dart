import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provider/provider.dart';

import '../../logic/cubit/user_cubit/user_cubit.dart';
import '../../logic/cubit/user_cubit/user_state.dart';
// import '../../navigation/navigation_bar/provider/index_navigation.dart';
// import '../../navigation/navigation_bar/navigation_bar.dart';
// import '../../services/sign_in_service.dart';
// import '../../../utils/routes/routes_name.dart';
// import '../../darta/models/user/user_model.dart';

class SignupProvider extends ChangeNotifier {
  final BuildContext context;
  SignupProvider(this.context) {
    _listenToUserCubit();
  }

  bool isLoading = false;
  String error = "";

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamSubscription? _userSubscription;

  void _listenToUserCubit() {
    _userSubscription =
        BlocProvider.of<UserCubit>(context).stream.listen((userState) {
      if (userState is UserLoadingState) {
        isLoading = true;
        error = "";
        notifyListeners();
      } else if (userState is UserErrorState) {
        isLoading = false;
        error = userState.message;
        notifyListeners();
      } else {
        isLoading = false;
        error = "";
        notifyListeners();
      }
    });
  }

  void createAccount() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String address = addressController.text.trim();

    BlocProvider.of<UserCubit>(context).createAccount(
      data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "type": "customer",
        "phone": phone,
        "district_area_id": 8,
        "address": address,
        "password": password,
        "status": true
      },
    );
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }

  // bool _loading = false;
  // bool get isLoading => _loading;

  // setLoading(bool value) {
  //   _loading = value;
  //   notifyListeners();
  // }

  // void signIn(
  //   BuildContext context,
  //   TextEditingController email,
  //   TextEditingController password,
  // ) async {
  //   // setLoading(true);

  //   final UserModel signinModel = UserModel(
  //     email: email.text.trim(),
  //     password: password.text.trim(),
  //   );

  //   signinServices.signinUser(signinModel, context).then((value) {
  //     if (value != null) {
  //       storage.write(key: 'token', value: value.accessToken);
  //       notifyListeners();
  //       Future.delayed(const Duration(seconds: 3)).then((value) {
  //         // setLoading(false);
  //         Provider.of<NavigationIndex>(context, listen: false).currentIndex = 0;
  //         Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => const BottomNavigationScreen(),
  //         ));
  //         // Navigator.pushNamed(context, RouteName.home);
  //         clearTextfield(email, password);
  //       });
  //     } else {
  //       // setLoading(false);
  //     }
  //   });
  //   // setLoading(false);
  // }

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
