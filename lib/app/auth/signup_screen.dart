import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/sign_up_provider.dart';

import 'widgets/sign_up_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   leading: IconButton(
          //     splashRadius: 20,
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: FaIcon(
          //       FontAwesomeIcons.arrowLeft,
          //       color: Colors.grey.shade500,
          //       size: 21,
          //     ),
          //   ),
          // ),
          body: SignUpForm(
            formKey: provider.formKey,
            firstNameController: provider.firstNameController,
            lastNameController: provider.lastNameController,
            emailController: provider.emailController,
            phoneController: provider.phoneController,
            passwordController: provider.passwordController,
            addressController: provider.addressController,
          ),
        ),
      ),
    );
  }
}
