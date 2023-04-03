// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vegipak/screens/home.dart';

import '../functions.dart' as Functions;
import '../constants.dart' as Constants;
import '../globals.dart' as Globals;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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

  void _tooglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onTapForgotPassword() {}

  void _onTapDriverRegistration() {}

  void _setRememberMe() {
    setState(() {
      _isRememberMe = !_isRememberMe;
    });
  }

  void _onSubmitLogin() async {
    _hasApiError = false;
    _hasEmailError = false;
    _hasPasswordError = false;
    _isLoading = false;

    var email = _emailController.text.trim();
    var password = _passwordController.text.trim();

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

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );

    // setState(() {
    //   _apiError = this._errors[6];
    //   _hasApiError = true;
    //   _isLoading = false;
    // });
    return;
  }

  void _submitButtonClick() {
    FocusScope.of(context).unfocus();
    _onSubmitLogin();
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> setUserAndPassword() async {
    final SharedPreferences prefs = await Globals.sharedPrefs;
    String? rememberUserEmail =
        prefs.getString(Constants.Constants.prefUserEmail);
    String? rememberUserPass =
        prefs.getString(Constants.Constants.prefUserPass);
    if (rememberUserEmail != null &&
        rememberUserEmail != '' &&
        rememberUserPass != null &&
        rememberUserPass != '') {
      setState(() {
        _emailController.text = rememberUserEmail;
        _passwordController.text = rememberUserPass;
        _isRememberMe = true;
      });
    }
  }

  @override
  void initState() {
    setUserAndPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final mQuery = MediaQuery.of(context);
    return Scaffold(
//       bottomSheet: Padding(
//         padding: EdgeInsets.only(left: 7, top: 10, right: 7, bottom: 5),
//         child: TextAnchor(
//           textColor: Colors.black87,
//           linkColor: Colors.lightBlue[800],
//           fontWeight: FontWeight.w800,
//           fontSize: 11.0,
//           text: '''
// Al registrarte aceptas nuestra (Política de Privacidad)[https://admin.nexmovelatam.com/politicas-de-privacidad] y (Condiciones de Uso)[https://admin.nexmovelatam.com/terminos-de-uso]
//               ''',
//           onTapLink: (link) {
//             launchURL(link);
//           },
//         ),
//       ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 80),
              Image.asset(
                Constants.Constants.companyFullLogoLight,
                //color: Colors.black,
                // width: 224,
                height: 150,
                alignment: Alignment.center,
              ),
/*              
              SizedBox(
                height: 25,
              ),
              Text(
                'Bienvenido',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ), 
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Inicie sesión',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Constants.COLOR_PRIMARY_TEXT,
                  ),
                ),
              ),
*/
              const SizedBox(height: 25),
              _hasApiError
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        _apiError,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Card(
                margin: const EdgeInsets.only(left: 20, right: 20),
                elevation: 6,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.green,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          maxLines: 1,
                          onSubmitted: (value) => _onSubmitLogin(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              _hasEmailError
                  ? Container(
                      margin: const EdgeInsets.only(
                          bottom: 15, left: 16, right: 16),
                      child: Text(
                        _emailError,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).errorColor,
                          //fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Card(
                margin: const EdgeInsets.only(left: 20, right: 20),
                elevation: 6,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.vpn_key,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.green,
                          controller: _passwordController,
                          obscureText: _obscureText,
                          autocorrect: false,
                          maxLines: 1,
                          onSubmitted: (value) => _onSubmitLogin(),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        color: Colors.green,
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: _tooglePasswordVisibility,
                      ),
                      const SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _hasPasswordError
                  ? Container(
                      margin: const EdgeInsets.only(
                          bottom: 15, left: 16, right: 16),
                      child: Text(
                        _passwordError,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).errorColor,
                          //fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Checkbox(
                      value: _isRememberMe,
                      checkColor: Colors.green,
                      activeColor: Colors.white54.withOpacity(0.1),
                      onChanged: (value) {
                        _setRememberMe();
                        // SharedPreferences prefs = await _prefs;
                        // prefs.setBool('remember_me', value);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Remember me',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _onTapForgotPassword,
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              _isLoading
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red),
                            value: null,
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: 50,
                      margin:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: _submitButtonClick,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              Container(
                //margin: EdgeInsets.only(right: 16, left: 16),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: _onTapDriverRegistration,
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
//                   Expanded(
//                     flex: 8,
//                     child: TextAnchor(
//                       textColor: Colors.black87,
//                       linkColor: Colors.lightBlue[800],
//                       fontWeight: FontWeight.w500,
//                       fontSize: 13.0,
//                       text: '''
// Al registrarte aceptas nuestra (Política de Privacidad)[https://admin.nexmovelatam.com/politicas-de-privacidad] y (Condiciones de Uso)[https://admin.nexmovelatam.com/terminos-de-uso]
//               ''',
//                       onTapLink: (link) {
//                         launchURL(link);
//                       },
//                     ),
//                   ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
