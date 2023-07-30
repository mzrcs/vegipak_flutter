import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/components/button_widget.dart';
import 'provider/profile_provider.dart';

class UpdateMyProfile extends StatefulWidget {
  const UpdateMyProfile({super.key});

  @override
  State<UpdateMyProfile> createState() => _UpdateMyProfileState();
}

class _UpdateMyProfileState extends State<UpdateMyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Consumer<ProfileProvider>(builder: (context, value, _) {
            return value.isLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2.0)),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        profileField(
                          context: context,
                          initialValue: value.userModel.firstName,
                          labelText: 'First',
                          hintText: 'First Name',
                        ),
                        const SizedBox(height: 16),
                        profileField(
                          context: context,
                          initialValue: value.userModel.lastName,
                          labelText: 'Last',
                          hintText: 'Last Name',
                        ),
                        const SizedBox(height: 16),
                        profileField(
                          context: context,
                          initialValue: value.userModel.email,
                          labelText: 'Email',
                          hintText: 'Email Address',
                        ),
                        const SizedBox(height: 16),
                        profileField(
                          context: context,
                          initialValue: value.userModel.phone,
                          labelText: 'Phone',
                          hintText: 'Phone',
                        ),
                        const SizedBox(height: 16),
                        myButton(
                          'Update',
                          () {},
                        )
                      ],
                    ),
                  );
          })
        ],
      ),
    );
  }

  Widget profileField({
    required BuildContext context,
    required String initialValue,
    required String labelText,
    required String hintText,
  }) {
    return TextFormField(
      initialValue: initialValue,
      validator: (val) =>
          val != null && val.isNotEmpty ? null : 'Required Field',
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        label: Text(
          labelText,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
