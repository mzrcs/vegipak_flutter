// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/sign_up_provider.dart';

import '../../components/button_widget.dart';

class SignUpOTP extends StatelessWidget {
  const SignUpOTP({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SignupProvider>(context, listen: false).getVerifiyEmail();
    });
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Verification Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'We have sent to the verification code to',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Consumer<SignupProvider>(
                    builder: (context, vale, _) {
                      return RichText(
                        text: TextSpan(
                          text: vale.verifyEmail,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          // children: <TextSpan>[
                          //   TextSpan(
                          //     text: '  Change email address ?',
                          //     style: const TextStyle(
                          //         color: Colors.blueAccent, fontSize: 16),
                          //     recognizer: TapGestureRecognizer()
                          //       ..onTap = () {
                          //         // navigate to desired screen
                          //       },
                          //   )
                          // ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: OtpTextField(
                textStyle: const TextStyle(color: Colors.black),
                autoFocus: true,
                borderWidth: 1.5,
                // cursorColor: Colors.white,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                fieldWidth: 64,
                numberOfFields: 4,
                keyboardType: TextInputType.number,
                focusedBorderColor: Colors.black54,
                borderRadius: BorderRadius.circular(6),
                showFieldAsBox: true,
                onSubmit: (String verificationCode) {
                  // value.onSubmitCode(verificationCode);
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: myButton(
                'Confirm',
                () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
