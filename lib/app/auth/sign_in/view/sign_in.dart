import 'package:flutter/material.dart';
// import 'package:vegipak/widgets/button_widget.dart';
// import 'package:vegipak/widgets/textfield_widget.dart';
// import '../../../../screens/home.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/logo_widget.dart';
import '../../../../widgets/textfield_widget.dart';
// import '../../../core/const.dart';
// import '../../../utils/routes/routes_name.dart';
// import '../../../../widgets/logo_widget.dart';
import '../../../utils/routes/routes_name.dart';
import '../provider/sign_in_prov.dart';
import 'package:provider/provider.dart';
// import '/functions.dart' as Functions;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // bool _obscureText = true;
  // bool _hasApiError = false;
  // bool _hasEmailError = false;
  // bool _hasPasswordError = false;
  // bool _isLoading = false;
  // String _emailError = '';
  // String _passwordError = '';
  // final String _apiError = '';
  // bool _isRememberMe = false;
  // final List<String> _errors = [
  //   'Email is invalid', // 0
  //   'Enter your email', // 1
  //   'Password must be longer than 8 characters', // 2
  //   'Enter your password', //3
  //   'Email or password is wrong, please check', // 4
  //   'An unexpected error has occurred, please try again', // 5
  //   'Please check your internet connection and try again', // 6
  //   'Server error, please try again', // 7
  // ];

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

  // void _onSubmitLogin() async {
  //   _hasApiError = false;
  //   _hasEmailError = false;
  //   _hasPasswordError = false;
  //   _isLoading = false;

  //   var email = emailController.text.trim();
  //   var password = passwordController.text.trim();

  //   if (email.isNotEmpty) {
  //     if (!Functions.isEmailValid(email)) {
  //       _emailError = _errors[0];
  //       _hasEmailError = true;
  //     }
  //   } else {
  //     _emailError = _errors[1];
  //     _hasEmailError = true;
  //   }

  //   if (password.isNotEmpty) {
  //     /*if (password.length <= 8) {
  //       _passwordError = this._errors[2];
  //       _hasPasswordError = true;
  //     }*/
  //   } else {
  //     _passwordError = _errors[3];
  //     _hasPasswordError = true;
  //   }

  //   if (_hasEmailError || _hasPasswordError) {
  //     setState(() {}); // Just notify that the state changed
  //     return;
  //   }

  //   //Form validation pass
  //   setState(() {
  //     _hasApiError = false;
  //     _hasEmailError = false;
  //     _hasPasswordError = false;
  //     _isLoading = false;
  //   });

  //   Navigator.pushNamed(context, RouteName.home);

  //   // setState(() {
  //   //   _apiError = this._errors[6];
  //   //   _hasApiError = true;
  //   //   _isLoading = false;
  //   // });
  //   return;
  // }

  // void _submitButtonClick() {
  //   // FocusScope.of(context).unfocus();
  //   _onSubmitLogin();
  // }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: const Color.fromARGB(255, 245, 240, 240),
    //     body: SingleChildScrollView(
    //       child: Consumer<SignIn>(
    //         builder: (context, value, child) {
    //           return Form(
    //             key: value.formGlobalKey,
    //             child: Stack(children: [
    //               Column(
    //                 children: [
    //                   // Stack(children: [
    //                   // ClipPath(
    //                   //   clipper: WaveClipper(),
    //                   //   child: Container(
    //                   //     color: const Color.fromARGB(255, 144, 180, 153),
    //                   //     // color: kBlackcolor,
    //                   //     height: size.height * 0.27,
    //                   //   ),
    //                   // ),
    //                   // ClipPath(
    //                   //   clipper: WaveClipper2(),
    //                   //   child: Container(
    //                   //     // color: const Color.fromARGB(255, 144, 180, 153),
    //                   //     color: Colors.black,
    //                   //     height: size.height * 0.25,
    //                   //   ),
    //                   // ),
    //                   //  Padding(
    //                   //    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
    //                   //    child: Image.asset('assets/WA1.png',width: 300,height: 300,),
    //                   //  ),
    //                   // ]),
    //                   // Image.asset('assets/21d4d48efa8c7d5f279726fa043e9d0b.png'),
    //                   const SizedBox(height: 250),
    //                   const Padding(
    //                     padding: EdgeInsets.fromLTRB(0, 0, 250, 10),
    //                     child: Text('Sign In',
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.w900, fontSize: 28)),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.all(18.0),
    //                     child: TextFormField(
    //                       controller: value.email,
    //                       decoration: const InputDecoration(
    //                         hintText: " Email",
    //                         focusedBorder: OutlineInputBorder(
    //                           borderSide:
    //                               BorderSide(color: Colors.black, width: 1.5),
    //                           borderRadius:
    //                               BorderRadius.all(Radius.circular(40)),
    //                         ),
    //                         hintStyle: TextStyle(color: Colors.grey),
    //                         border: OutlineInputBorder(
    //                             borderRadius:
    //                                 BorderRadius.all(Radius.circular(40))),
    //                       ),
    //                       validator: (valuee) => value.emailValidation(valuee),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
    //                     child: TextFormField(
    //                       controller: value.password,
    //                       obscureText: value.isobscure,
    //                       decoration: InputDecoration(
    //                         suffixIcon: IconButton(
    //                             onPressed: () {
    //                               value.visibility();
    //                             },
    //                             icon: value.icon),
    //                         hintText: " Password",
    //                         focusedBorder: const OutlineInputBorder(
    //                           borderSide:
    //                               BorderSide(color: Colors.black, width: 1.5),
    //                           borderRadius:
    //                               BorderRadius.all(Radius.circular(40)),
    //                         ),
    //                         hintStyle: const TextStyle(color: Colors.grey),
    //                         border: const OutlineInputBorder(
    //                             borderRadius:
    //                                 BorderRadius.all(Radius.circular(40))),
    //                       ),
    //                       validator: (valuee) =>
    //                           value.passwordValidation(valuee),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.fromLTRB(200, 0, 0, 7),
    //                     child: TextButton(
    //                         onPressed: () {
    //                           // Navigator.of(context).push(MaterialPageRoute(
    //                           //   builder: (context) => const ScreenForgotPass(),
    //                           // ));
    //                         },
    //                         child: const Text(
    //                           'Forgot Password?',
    //                           style:
    //                               TextStyle(color: kBlackcolor, fontSize: 15),
    //                         )),
    //                   ),
    //                   value.isLoading
    //                       ? const Center(child: CircularProgressIndicator())
    //                       : ElevatedButton(
    //                           style: ElevatedButton.styleFrom(
    //                             foregroundColor: Colors.white,
    //                             backgroundColor: Colors.black,
    //                             disabledForegroundColor: Colors.grey,
    //                             elevation: 20,
    //                             minimumSize: const Size(350, 50),
    //                             shadowColor: Colors.blueGrey,
    //                             shape: RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(30)),
    //                           ),
    //                           onPressed: () {
    //                             // Provider.of<SignIn>(context, listen: false)
    //                             //     .setNotesData();
    //                             // Provider.of<SignIn>(context, listen: false)
    //                             //     .signIn(context);
    //                             value.signIn(context);
    //                           },
    //                           child: const Text('Sign in'),
    //                         ),
    //                   Column(
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           const Text("Don't have any account?"),
    //                           TextButton(
    //                             onPressed: () {
    //                               // Navigator.of(context).push(MaterialPageRoute(
    //                               //   builder: (context) => const SignUpScreen(),
    //                               // ));
    //                             },
    //                             child: const Text(
    //                               'Sign Up',
    //                               style: TextStyle(
    //                                   color: kBlackcolor, fontSize: 15),
    //                             ),
    //                           )
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ]),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoWidget(),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<SignIn>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldWidget(
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: value.email,
                      onChanged: (value) {},
                    ),
                    // _hasEmailError
                    //     ? Container(
                    //         margin: const EdgeInsets.only(left: 8, top: 8),
                    //         child: Text(
                    //           _emailError,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             fontSize: 16,
                    //             color: Theme.of(context).errorColor,
                    //             //fontWeight: FontWeight.w600,
                    //           ),
                    //         ),
                    //       )
                    //     : const SizedBox(),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: value.password,
                      onChanged: (value) {},
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Consumer<SignIn>(
            builder: (context, value, child) {
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: myButton(
                        'Sign in',
                        () {
                          // value.loginApi(context);
                          Provider.of<SignIn>(context, listen: false)
                              .signIn(context);
                        },
                        // () {
                        //   if (!formKey.currentState!.validate()) {
                        //     return;
                        //   }

                        //   Navigator.pushNamed(context, RouteName.home);
                        // },
                      ),
                    );
            },
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
