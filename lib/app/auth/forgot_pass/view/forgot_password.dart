import 'package:flutter/material.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/logo_widget.dart';
import '../../../widgets/textfield_widget.dart';
import '../../../utils/routes/routes_name.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          logoWidget(),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Enter the E-mail associated with your account and we will send an email with instructions to reset your password.',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                phoneFieldWidget(
                  context: context,
                  hintText: 'Email',
                  iconData: Icons.email,
                  controller: _emailController,
                  onChanged: (_) => {},
                ),
                // if (!value.isEmailValid) errorText(value.emailError),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: myButton(
              'Submit',
              () => Navigator.of(context).pushNamed(RouteName.otp),
            ),
          ),
        ],
      ),
    );
  }
}
