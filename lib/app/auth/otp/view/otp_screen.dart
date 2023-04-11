import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
// import 'package:vegipak/main.dart';
import '../../../../widgets/button_widget.dart';
import '../provider/otp_verification_prov.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 245, 240, 240),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Verify it\'s you'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 55, 24, 0),
                child: Text(
                  'We have sent to the verification code to the email example@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Consumer<VerifyOtpProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return OtpTextField(
                    textStyle: const TextStyle(color: Colors.black),
                    fieldWidth: 60,
                    numberOfFields: 5,
                    keyboardType: TextInputType.number,
                    borderColor: Colors.grey,
                    enabledBorderColor: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode) {
                      value.onSubmitCode(verificationCode);
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: myButton(
                  'Submit',
                  () => {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
