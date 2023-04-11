import 'package:flutter/material.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/logo_widget.dart';
import '../../../../widgets/textfield_widget.dart';
import '../../../utils/routes/routes_name.dart';
import '../provider/sign_in_prov.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // bool _isEmailValid = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            child: Consumer<SignIn>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldWidget(
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: _emailController,
                      onChanged: (_) =>
                          value.validateEmail(_emailController.text),
                    ),
                    if (!value.isEmailValid) errorText(value.emailError),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: _passwordController,
                      onChanged: (_) =>
                          value.validatePass(_passwordController.text),
                    ),
                    if (!value.isPassValid) errorText(value.passError)
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Consumer<SignIn>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: myButton(
                  'Sign in',
                  (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) ||
                          (!value.isEmailValid || !value.isPassValid)
                      ? null
                      : () {
                          // value.loginApi(context);
                          Provider.of<SignIn>(context, listen: false).signIn(
                            context,
                            _emailController,
                            _passwordController,
                          );
                        },
                  loading: value.isLoading,
                ),
              );
            },
          ),
          const SizedBox(height: 15),
          Center(
            child: myTextButton(
              'Forgot Password ?',
              () => Navigator.of(context).pushNamed(RouteName.forgotPassword),
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: myTextButton(
                'Create an account',
                () => Navigator.of(context).pushNamed(RouteName.signup),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorText(String errorText) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
      child: Center(
        child: Text(
          errorText,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
