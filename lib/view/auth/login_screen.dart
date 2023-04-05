import 'package:flutter/material.dart';
import 'package:vegipak/widgets/button_widget.dart';
import 'package:vegipak/widgets/textfield_widget.dart';
import '../../screens/home.dart';
import '../../utils/routes/routes_name.dart';
import '../../widgets/logo_widget.dart';
import '/functions.dart' as Functions;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _hasApiError = false;
  bool _hasEmailError = false;
  bool _hasPasswordError = false;
  bool _isLoading = false;
  String _emailError = '';
  String _passwordError = '';
  final String _apiError = '';
  bool _isRememberMe = false;
  final List<String> _errors = [
    'Email is invalid', // 0
    'Enter your email', // 1
    'Password must be longer than 8 characters', // 2
    'Enter your password', //3
    'Email or password is wrong, please check', // 4
    'An unexpected error has occurred, please try again', // 5
    'Please check your internet connection and try again', // 6
    'Server error, please try again', // 7
  ];

  // void _tooglePasswordVisibility() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  // void _onTapForgotPassword() {}

  // void _onTapDriverRegistration() {}

  // void _setRememberMe() {
  //   setState(() {
  //     _isRememberMe = !_isRememberMe;
  //   });
  // }

  void _onSubmitLogin() async {
    _hasApiError = false;
    _hasEmailError = false;
    _hasPasswordError = false;
    _isLoading = false;

    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    if (email.isNotEmpty) {
      if (!Functions.isEmailValid(email)) {
        _emailError = _errors[0];
        _hasEmailError = true;
      }
    } else {
      _emailError = _errors[1];
      _hasEmailError = true;
    }

    if (password.isNotEmpty) {
      /*if (password.length <= 8) {
        _passwordError = this._errors[2];
        _hasPasswordError = true;
      }*/
    } else {
      _passwordError = _errors[3];
      _hasPasswordError = true;
    }

    if (_hasEmailError || _hasPasswordError) {
      setState(() {}); // Just notify that the state changed
      return;
    }

    //Form validation pass
    setState(() {
      _hasApiError = false;
      _hasEmailError = false;
      _hasPasswordError = false;
      _isLoading = false;
    });

    Navigator.pushNamed(context, RouteName.home);

    // setState(() {
    //   _apiError = this._errors[6];
    //   _hasApiError = true;
    //   _isLoading = false;
    // });
    return;
  }

  void _submitButtonClick() {
    // FocusScope.of(context).unfocus();
    _onSubmitLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoWidget(),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldWidget(
                    hintText: 'Email',
                    iconData: Icons.email,
                    controller: emailController,
                    onSubmitted: (value) => _onSubmitLogin(),
                  ),
                  _hasEmailError
                      ? Container(
                          margin: const EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            _emailError,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).errorColor,
                              //fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 12),
                  textFieldWidget(
                    hintText: 'Password',
                    iconData: Icons.lock,
                    controller: passwordController,
                    onSubmitted: (value) => _onSubmitLogin(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: myButton(
              'Sign in',
              _submitButtonClick,
              // () {
              //   if (!formKey.currentState!.validate()) {
              //     return;
              //   }

              //   Navigator.pushNamed(context, RouteName.home);
              // },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: myTextButton(
              'Create an account',
              () => Navigator.of(context).pushNamed(RouteName.signup),
            ),
          ),
        ],
      ),
    );
  }
}
