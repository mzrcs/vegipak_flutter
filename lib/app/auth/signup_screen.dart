import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/provider/signup_provider.dart';

import 'widgets/sign_up_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController cpasswordController = TextEditingController();
  // TextEditingController areaController = TextEditingController();
  // TextEditingController blockController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   areaController.text = 'Gulistan-e-Johuar';
  // }

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
    final provider = Provider.of<SignupProvider>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            splashRadius: 20,
            onPressed: () {
              // Navigator.pushNamed(context, AppPages.signupPath);
              Navigator.pop(context);
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.grey.shade500,
              size: 21,
            ),
          ),
        ),
        body: SignupForm(
          formKey: provider.formKey,
          firstNameController: provider.firstNameController,
          lastNameController: provider.lastNameController,
          emailController: provider.emailController,
          phoneController: provider.phoneController,
          passwordController: provider.passwordController,
          addressController: provider.addressController,
        ),

        // body: SingleChildScrollView(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const SizedBox(height: 50),
        //         logoWidget(),
        //         const SizedBox(height: 30),
        //         Container(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        //           child: Column(
        //             children: [
        //               textFieldWidget(
        //                 context: context,
        //                 hintText: 'First Name',
        //                 iconData: Icons.person,
        //                 controller: firstNameController,
        //               ),
        //               const SizedBox(height: 12),
        //               textFieldWidget(
        //                 context: context,
        //                 hintText: 'Last Name',
        //                 iconData: Icons.person,
        //                 controller: lastNameController,
        //               ),
        //               const SizedBox(height: 12),
        //               textFieldWidget(
        //                 context: context,
        //                 hintText: 'Email',
        //                 iconData: Icons.email,
        //                 controller: emailController,
        //               ),
        //               const SizedBox(height: 12),
        //               textFieldWidget(
        //                 context: context,
        //                 hintText: '3xxxxxxxxx',
        //                 iconData: Icons.phone,
        //                 isPhoneField: true,
        //                 controller: phoneController,
        //               ),
        //               const SizedBox(height: 12),
        //               textFieldWidget(
        //                 context: context,
        //                 hintText: 'Password',
        //                 iconData: Icons.lock,
        //                 controller: emailController,
        //               ),
        //               const SizedBox(height: 12),
        //               textFieldWidget(
        //                 context: context,
        //                 hintText: 'Confirm Password',
        //                 iconData: Icons.lock,
        //                 controller: cpasswordController,
        //               ),
        //               const SizedBox(height: 12),
        //               textFieldWidget(
        //                 context: context,
        //                 hintText: 'Area',
        //                 iconData: Icons.map,
        //                 controller: areaController,
        //               ),
        //               const SizedBox(height: 12),
        //               dropDownWidget(
        //                 hintText: const Text('Select Block'),
        //                 iconData: Icons.map,
        //                 value: dropdownvalue,
        //                 items: items.map((String item) {
        //                   return DropdownMenuItem(
        //                     value: item,
        //                     child: Text(item),
        //                   );
        //                 }).toList(),
        //                 onChanged: (String? newValue) {
        //                   setState(() {
        //                     dropdownvalue = newValue!;
        //                   });
        //                 },
        //               ),
        //             ],
        //           ),
        //         ),
        //         const SizedBox(height: 20),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 20),
        //           child: myButton(
        //             'Sign up',
        //             () => Navigator.of(context).pushNamed(RouteName.otp),
        //           ),
        //         ),
        //         const SizedBox(height: 10),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 20),
        //           child: myTextButton(
        //             'Already have an account? Sign in',
        //             () => Navigator.of(context).pushNamed(RouteName.login),
        //           ),
        //         ),
        //         const SizedBox(height: 50),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
