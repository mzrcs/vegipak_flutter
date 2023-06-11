import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../auth/provider/user_provider.dart';
import '../../../model/user/token.dart';
import '../../../utils/routes/routes_name.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider(context) {
    getSavedData(context);
  }

  AuthModel authModel = AuthModel();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool _loading = false;
  bool get isLoading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? email;

  Future<void> getSavedData(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email');
    emailController.text = email!;
    notifyListeners();
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

  void logOut(context) async {
    final userPrefrence = Provider.of<UserProvider>(context, listen: false);

    await storage.delete(key: 'token');
    userPrefrence.remove();

    Navigator.pushNamedAndRemoveUntil(
        context, RouteName.login, (route) => false);
    notifyListeners();
  }
}
