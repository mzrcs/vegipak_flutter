import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../widgets/logo_widget.dart';
import '../../../widgets/textfield_widget.dart';
import '../../logic/cubit/user_cubit/user_cubit.dart';
import '../../logic/cubit/user_cubit/user_state.dart';
import '../../navigation/settings/provider/settings_provider.dart';
import '../../utils/constants.dart';
import '../../utils/routes/routes_name.dart';
import '../provider/login_provider.dart';
import 'auth_bottom_rich_text.dart';
import 'auth_confim_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    final settingsManager =
        Provider.of<SettingsProvider>(context, listen: false);

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: widget.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 12),

                    BlocListener<UserCubit, UserState>(
                      listener: (context, state) {
                        if (state is UserLoggedInState) {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacementNamed(
                            context,
                            RouteName.home,
                          );
                        }
                      },
                      child: logoWidget(),
                    ),
                    const SizedBox(height: 45),

                    (provider.error != "")
                        ? Text(provider.error,
                            style: const TextStyle(color: Colors.red))
                        : const SizedBox(),

                    const SizedBox(height: 15),

                    // !: Email field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: widget.emailController,
                    ),
                    const SizedBox(height: 12),

                    // !: Password field
                    textFieldWidget1(
                      context: context,
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: widget.passwordController,
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
                    AuthConfirmButton(
                      title: 'Log in',
                      callBack: provider.logIn,
                    ),
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
