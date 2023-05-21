import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/logo_widget.dart';
import '../../../widgets/textfield_widget.dart';
import '../../utils/constants.dart';
import '../../utils/routes/routes_name.dart';
import '../provider/sign_in_provider.dart';
import 'auth_bottom_rich_text.dart';
import 'auth_confim_button.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<LoginProvider>(builder: (context, provider, _) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 12),

                    logoWidget(),
                    const SizedBox(height: 50),

                    // !: Email field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: provider.emailController,
                      readOnly: provider.isLoading ? true : false,
                    ),
                    const SizedBox(height: 16),

                    // !: Password field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: provider.passwordController,
                      readOnly: provider.isLoading ? true : false,
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text: 'Forget Password?',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(
                              //   context,
                              //   AppPages.forgetPasswordPath,
                              //   arguments: true,
                              // );
                            },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Consumer<LoginProvider>(builder: (context, value, _) {
                      return AuthConfirmButton(
                        isLoading: value.isLoading,
                        title: 'Sign in',
                        callBack: () {
                          // provider.signIn(context);
                          Provider.of<LoginProvider>(context, listen: false)
                              .signIn(context);
                        },
                      );
                    }),
                    SizedBox(height: MediaQuery.of(context).size.height / 4.5),
                    AuthBottomRichText(
                      detailText: 'Don\'t have account? ',
                      clickableText: 'Sign up',
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.signup);
                      },
                      darkColor: Colors.grey.shade500,
                      lightColor: kGreenColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 150,
              child: provider.isLoading
                  ? const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        );
      }),
    );
  }
}
