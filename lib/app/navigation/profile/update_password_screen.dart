import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/profile/provider/profile_provider.dart';
import '../../components/button_widget.dart';
import '../../custom/annotated_widget.dart';
import '../../components/textfield_widget.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      Provider.of<ProfileProvider>(context, listen: false).resetLoading();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedWidget(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
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
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Update Password',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 16),
              Consumer<ProfileProvider>(builder: (context, value, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: value.passformKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        textFieldPasswordWidget1(
                          context: context,
                          obscureText: value.isobscureCurrent,
                          onIconPress: value.visibilityCurrent,
                          hintText: 'Current Password',
                          iconData: Icons.lock,
                          controller: value.oldPasswordController,
                          validator: value.textFieldValidator.validatePassword,
                        ),
                        const SizedBox(height: 12),
                        textFieldPasswordWidget1(
                          context: context,
                          obscureText: value.isobscureNew,
                          onIconPress: value.visibilityNew,
                          hintText: 'New Password',
                          iconData: Icons.lock,
                          controller: value.newPasswordController,
                          validator:
                              value.textFieldValidator.validateNewPassword,
                        ),
                        const SizedBox(height: 30),
                        myButton(
                          'Update Password',
                          () {
                            Provider.of<ProfileProvider>(context, listen: false)
                                .updatePassword(context);
                          },
                          loading: value.isLoading2,
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
