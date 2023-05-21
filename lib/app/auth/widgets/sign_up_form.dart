import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/utils/constants.dart';
import '../../../widgets/textfield_widget.dart';
// import '../../utils/routes/routes_name.dart';
import '../provider/sign_up_provider.dart';
import 'auth_bottom_rich_text.dart';
import 'auth_confim_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(builder: (context, provider, _) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            IconButton(
              padding: const EdgeInsets.only(left: 12.0),
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const FaIcon(
                FontAwesomeIcons.arrowLeftLong,
                color: Colors.grey,
                size: 21,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Sign up',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 30, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 30),

            // Signup Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // !: First Name field
                    textFieldWidget1(
                      context: context,
                      hintText: 'First Name',
                      iconData: Icons.person,
                      controller: firstNameController,
                    ),
                    const SizedBox(height: 12),

                    // !: Last Name field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Last Name',
                      iconData: Icons.person,
                      controller: lastNameController,
                    ),
                    const SizedBox(height: 12),

                    // !: Email field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: emailController,
                    ),
                    const SizedBox(height: 12),

                    // !: Phone field
                    phoneFieldWidget(
                      context: context,
                      hintText: '3xxxxxxxxx',
                      iconData: Icons.phone,
                      isPhoneField: true,
                      controller: phoneController,
                    ),
                    const SizedBox(height: 12),

                    // !: Password field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 12),

                    // !: Address field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Address',
                      iconData: Icons.home,
                      controller: addressController,
                    ),
                    const SizedBox(height: 30),
                    Consumer<SignupProvider>(builder: (context, value, _) {
                      return AuthConfirmButton(
                        isLoading: value.isLoading,
                        title: 'Sign up',
                        callBack: () {
                          Provider.of<SignupProvider>(context, listen: false)
                              .signUp(context);
                        },
                      );
                    }),

                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    AuthBottomRichText(
                      detailText: 'Already hav an account? ',
                      clickableText: 'Sign In',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      darkColor: Colors.grey.shade500,
                      lightColor: kGreenColor,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
