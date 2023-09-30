import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../components/textfield_widget.dart';
import '../../core/constants/my_colors.dart';
import '../../utils/utils.dart';
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
      return ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 8),
          // IconButton(
          //   padding: const EdgeInsets.only(left: 12.0),
          //   splashRadius: 20,
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const FaIcon(
          //     FontAwesomeIcons.arrowLeftLong,
          //     color: Colors.grey,
          //     size: 21,
          //   ),
          // ),
          // const SizedBox(height: 12),
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
                    validator: provider.textFieldValidator.validateFirstName,
                  ),
                  const SizedBox(height: 12),

                  // !: Last Name field
                  textFieldWidget1(
                    context: context,
                    hintText: 'Last Name',
                    iconData: Icons.person,
                    controller: lastNameController,
                    validator: provider.textFieldValidator.validateLastName,
                  ),
                  const SizedBox(height: 12),

                  // !: Email field
                  textFieldWidget1(
                    context: context,
                    hintText: 'Email',
                    iconData: Icons.email,
                    controller: emailController,
                    validator: provider.textFieldValidator.validateEmailAddress,
                  ),
                  const SizedBox(height: 12),

                  // !: Phone field
                  // phoneFieldWidget(
                  //   context: context,
                  //   hintText: '3XXXXXXXXX',
                  //   iconData: Icons.phone,
                  //   isPhoneField: true,
                  //   controller: phoneController,
                  //   inputFormatters: [
                  //     FilteringTextInputFormatter.digitsOnly,
                  //     LengthLimitingTextInputFormatter(10),
                  //   ],
                  // ),

                  textFieldWidget1(
                    context: context,
                    hintText: 'Phone',
                    iconData: Icons.phone,
                    controller: provider.phoneController,
                    textInputType: TextInputType.number,
                    validator: provider.textFieldValidator.validatePhoneNumber,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // !: Password field
                  // textFieldWidget1(
                  //   context: context,
                  //   hintText: 'Password',
                  //   iconData: Icons.lock,
                  //   controller: passwordController,
                  //   validator: provider.textFieldValidator.validatePassword,
                  // ),

                  textFieldPasswordWidget1(
                    obscureText: provider.isobscure,
                    onIconPress: provider.visibility,
                    context: context,
                    hintText: 'Password',
                    iconData: Icons.lock,
                    controller: provider.passwordController,
                    readOnly: provider.isLoading ? true : false,
                    validator: provider.textFieldValidator.validatePassword,
                  ),
                  const SizedBox(height: 12),

                  Utils().customDropdownButton(
                    context: context,
                    hintText: 'Select Area',
                    errorText: 'Please select area',
                    iconData: Icons.home,
                    items: provider.districtAreaList
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item.id.toString(),
                            child: Text(
                              item.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                    fontSize: 17,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      provider.selectAreaId(int.parse(value.toString()));
                    },
                  ),

                  const SizedBox(height: 12),

                  // !: Address field
                  textFieldWidget1(
                    context: context,
                    hintText: 'Address',
                    iconData: Icons.home,
                    controller: addressController,
                    validator: provider.textFieldValidator.validateAddress,
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
                    lightColor: MyColors.kGreenColor,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
