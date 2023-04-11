import 'package:flutter/material.dart';

import '../../../../widgets/button_widget.dart';
import '../../../../widgets/logo_widget.dart';
import '../../../../widgets/textfield_widget.dart';
import '../../../utils/routes/routes_name.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController blockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    areaController.text = 'Gulistan-e-Johuar';
  }

  String dropdownvalue = 'Block 1';
  var items = [
    'Block 1',
    'Block 2',
    'Block 3',
    'Block 4',
    'Block 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              logoWidget(),
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  children: [
                    textFieldWidget(
                      hintText: 'First Name',
                      iconData: Icons.person,
                      controller: firstNameController,
                    ),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: 'Last Name',
                      iconData: Icons.person,
                      controller: lastNameController,
                    ),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: 'Email',
                      iconData: Icons.email,
                      controller: emailController,
                    ),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: '3xxxxxxxxx',
                      iconData: Icons.phone,
                      isPhoneField: true,
                      controller: phoneController,
                    ),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: 'Password',
                      iconData: Icons.lock,
                      controller: emailController,
                    ),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: 'Confirm Password',
                      iconData: Icons.lock,
                      controller: cpasswordController,
                    ),
                    const SizedBox(height: 12),
                    textFieldWidget(
                      hintText: 'Area',
                      iconData: Icons.map,
                      controller: areaController,
                    ),
                    const SizedBox(height: 12),
                    dropDownWidget(
                      hintText: const Text('Select Block'),
                      iconData: Icons.map,
                      value: dropdownvalue,
                      items: items.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: myButton(
                  'Sign up',
                  () => Navigator.of(context).pushNamed(RouteName.otp),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: myTextButton(
                  'Already have an account? Sign in',
                  () => Navigator.of(context).pushNamed(RouteName.login),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
