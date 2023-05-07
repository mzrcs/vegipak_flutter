import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/login_provider.dart';
import 'widgets/log_in_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _emailController = TextEditingController();
  //   _passwordController = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginForm(
          formKey: provider.formKey,
          emailController: provider.emailController,
          passwordController: provider.passwordController,
        ),
      ),
    );
  }

  // Widget errorText(String errorText) {
  //   return Padding(
  //     padding:
  //         const EdgeInsets.only(top: 10.0, bottom: 6.0, left: 12, right: 12),
  //     child: Center(
  //       child: Text(
  //         errorText,
  //         // style: const TextStyle(
  //         //   color: Colors.red,
  //         //   fontSize: 15,
  //         // ),
  //         textAlign: TextAlign.center,
  //         style: Theme.of(context).textTheme.displaySmall!.copyWith(
  //               fontWeight: FontWeight.w300,
  //               color: kRedColor,
  //               fontSize: 14,
  //             ),
  //       ),
  //     ),
  //   );
  // }
}
