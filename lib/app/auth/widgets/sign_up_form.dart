import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/utils/constants.dart';

import '../../../widgets/textfield_widget.dart';
import '../../navigation/settings/provider/settings_provider.dart';
import '../../utils/routes/routes_name.dart';
import '../provider/signup_provider.dart';
import 'auth_bottom_rich_text.dart';
import 'auth_confim_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.addressController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController addressController;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);

    final settingsManager =
        Provider.of<SettingsProvider>(context, listen: false);

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0).copyWith(top: 8),
            child: Form(
              key: widget.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: MediaQuery.of(context).size.height / 12),
                    Text(
                      'Sign up',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 34),
                    ),
                    const SizedBox(height: 50),

                    (provider.error != "")
                        ? Text(provider.error,
                            style: const TextStyle(color: Colors.red))
                        : const SizedBox(),

                    const SizedBox(height: 12),

                    // !: First Name field
                    textFieldWidget1(
                      context: context,
                      hintText: 'First Name',
                      iconData: Icons.person,
                      controller: widget.firstNameController,
                    ),
                    const SizedBox(height: 8),

                    // !: Last Name field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Last Name',
                      iconData: Icons.person,
                      controller: widget.lastNameController,
                    ),
                    const SizedBox(height: 8),

                    // !: Email field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: widget.emailController,
                    ),
                    const SizedBox(height: 8),

                    // !: Phone field
                    textFieldWidget(
                      context: context,
                      hintText: '3xxxxxxxxx',
                      iconData: Icons.phone,
                      isPhoneField: true,
                      controller: widget.phoneController,
                    ),
                    const SizedBox(height: 8),

                    // !: Password field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: widget.passwordController,
                    ),
                    const SizedBox(height: 8),

                    // !: Address field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Address',
                      iconData: Icons.home,
                      controller: widget.addressController,
                    ),

                    const SizedBox(height: 40),
                    AuthConfirmButton(
                      title: 'Sign up',
                      callBack: provider.createAccount,
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height / 8),
                    AuthBottomRichText(
                      detailText: 'Already have an account? ',
                      clickableText: 'Log in',
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.login);
                      },
                      darkColor: Colors.grey.shade500,
                      lightColor: kGreenColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: provider.isLoading
                ? LinearProgressIndicator(
                    backgroundColor:
                        settingsManager.darkMode ? Colors.white : Colors.white,
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 4),
                  ),
          ),
        ],
      ),
    );
  }
}
