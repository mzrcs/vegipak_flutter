import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/components/button_widget.dart';
import 'package:vegipak/app/custom/annotated_widget.dart';
import '../../components/textfield_widget.dart';
import '../../utils/utils.dart';
import 'provider/profile_provider.dart';

class UpdateMyProfile extends StatefulWidget {
  const UpdateMyProfile({super.key});

  @override
  State<UpdateMyProfile> createState() => _UpdateMyProfileState();
}

class _UpdateMyProfileState extends State<UpdateMyProfile> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<ProfileProvider>(context, listen: false)
    //       .getSavedData(context);
    // });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileProvider>(context, listen: false)
          .getSavedData(context);
      Provider.of<ProfileProvider>(context, listen: false).getDistrictArea();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedWidget(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          // backgroundColor: Colors.white,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 8.0),
            // splashRadius: 20,
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
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Update Profile',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 24, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 16),
            Consumer<ProfileProvider>(
              builder: (context, value, _) {
                return value.isLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Center(
                              child:
                                  CircularProgressIndicator(strokeWidth: 2.0),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Form(
                          key: value.formKey,
                          child: Column(
                            children: [
                              // textFieldWidget1(
                              //   context: context,
                              //   // initialValue: value.userModel.firstName,
                              //   controller: value.firstNameController,
                              //   // labelText: 'First',
                              //   hintText: 'First Name',
                              //   validator:
                              //       value.textFieldValidator.validateFirstName,
                              // ),
                              textFieldWidget1(
                                context: context,
                                hintText: 'First Name',
                                iconData: Icons.person,
                                controller: value.firstNameController,
                                validator:
                                    value.textFieldValidator.validateFirstName,
                              ),
                              const SizedBox(height: 16),
                              // profileUpdateField(
                              //   context: context,
                              //   initialValue: value.userModel.lastName,
                              //   controller: value.lastNameController,
                              //   labelText: 'Last',
                              //   hintText: 'Last Name',
                              //   validator:
                              //       value.textFieldValidator.validateLastName,
                              // ),

                              textFieldWidget1(
                                context: context,
                                hintText: 'Last Name',
                                iconData: Icons.person,
                                controller: value.lastNameController,
                                validator:
                                    value.textFieldValidator.validateLastName,
                              ),
                              const SizedBox(height: 16),
                              // profileUpdateField(
                              //   context: context,
                              //   initialValue: value.userModel.email,
                              //   controller: value.emailController,
                              //   labelText: 'Email',
                              //   hintText: 'Email Address',
                              //   readOnly: true,
                              //   validator:
                              //       value.textFieldValidator.validateAddress,
                              // ),

                              textFieldWidget1(
                                readOnly: true,
                                context: context,
                                hintText: 'Email',
                                iconData: Icons.email,
                                controller: value.emailController,
                                validator:
                                    value.textFieldValidator.validateAddress,
                              ),
                              const SizedBox(height: 16),
                              // profileUpdateField(
                              //   context: context,
                              //   initialValue: value.userModel.phone,
                              //   controller: value.phoneController,
                              //   labelText: 'Phone',
                              //   hintText: 'Phone',
                              //   textInputType: TextInputType.number,
                              //   validator: value
                              //       .textFieldValidator.validatePhoneNumber,
                              //   inputFormatters: [
                              //     FilteringTextInputFormatter.digitsOnly,
                              //     LengthLimitingTextInputFormatter(11),
                              //   ],
                              // ),

                              textFieldWidget1(
                                context: context,
                                hintText: 'Phone',
                                iconData: Icons.phone,
                                controller: value.phoneController,
                                textInputType: TextInputType.number,
                                validator: value
                                    .textFieldValidator.validatePhoneNumber,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(11),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // profileUpdateField(
                              //   context: context,
                              //   initialValue: value.userModel.address,
                              //   labelText: 'Address',
                              //   hintText: 'Address',
                              //   controller: value.addressController,
                              //   validator:
                              //       value.textFieldValidator.validateAddress,
                              // ),

                              textFieldWidget1(
                                context: context,
                                hintText: 'Address',
                                iconData: Icons.home,
                                controller: value.addressController,
                                validator:
                                    value.textFieldValidator.validateAddress,
                              ),
                              const SizedBox(height: 16),
                              Consumer<ProfileProvider>(
                                builder: (context, provider, _) {
                                  log('area Id ${provider.selectedAreaId}');
                                  return Utils().customDropdownButton(
                                    value: provider.selectedAreaId.toString(),
                                    context: context,
                                    hintText: 'Select Area',
                                    errorText: 'Please select area',
                                    iconData: Icons.location_city,
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
                                      provider.selectAreaId(
                                          int.parse(value.toString()));
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              myButton(
                                'Update',
                                () {
                                  Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .updateProfile(context);
                                },
                                loading: value.isLoading2,
                              )
                            ],
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
