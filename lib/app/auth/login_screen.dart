import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/sign_in_provider.dart';
import 'package:vegipak/app/auth/widgets/log_in_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: LoginForm(
            formKey: provider.formKey,
            emailController: provider.emailController,
            passwordController: provider.passwordController,
          ),
        ),
      ),
    );
  }
}
