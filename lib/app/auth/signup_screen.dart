import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/sign_up_provider.dart';
import 'package:vegipak/app/custom/annotated_widget.dart';

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

    return AnnotatedWidget(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          // backgroundColor: Colors.white,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 8.0),
            // splashRadius: 20,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeftLong,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ),
        body: provider.areaLoading
            ? const Center(child: CircularProgressIndicator())
            : SignUpForm(
                formKey: provider.formKey,
                firstNameController: provider.firstNameController,
                lastNameController: provider.lastNameController,
                emailController: provider.emailController,
                phoneController: provider.phoneController,
                passwordController: provider.passwordController,
                addressController: provider.addressController,
              ),
      ),
    );
  }
}
