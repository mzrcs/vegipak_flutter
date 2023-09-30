import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/forgot_password_provider.dart';
import 'package:vegipak/app/custom/annotated_widget.dart';
import '../components/button_widget.dart';
import '../components/textfield_widget.dart';
// import '../utils/routes/routes_name.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedWidget(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.only(left: 8.0),
            splashRadius: 20,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer<ForgotPasswordProvider>(
              builder: (context, value, _) {
                return Form(
                  key: value.formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'Enter the E-mail associated with your account and we will send an email with instructions to reset your password.',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        textFieldWidget1(
                          context: context,
                          hintText: 'Email',
                          iconData: Icons.email,
                          controller: value.forgotEmailController,
                          readOnly: value.isLoading ? true : false,
                          validator: value.textFieldValidator.validateEmailAddress,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<ForgotPasswordProvider>(builder: (contex, value, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: myButton(
                  'Submit',
                  loading: value.isLoading,
                  () {
                    Provider.of<ForgotPasswordProvider>(context, listen: false)
                        .forgotPassword(context);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
