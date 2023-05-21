import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/textfield_widget.dart';
import '../../../auth/provider/sign_up_provider.dart';
import '../../../auth/widgets/auth_confim_button.dart';
import '../provider/profile_provider.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(builder: (context, provider, _) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            // Signup Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // !: Email field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: emailController,
                    ),

                    const SizedBox(height: 30),
                    Consumer<ProfileProvider>(builder: (context, value, _) {
                      return AuthConfirmButton(
                        title: 'Update',
                        callBack: () {},
                      );
                    }),

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
