import 'package:flutter/material.dart';
import 'package:vegipak/app/auth/widgets/auth_confim_button.dart';

import '../components/logo_widget.dart';
import '../core/constants/my_colors.dart';
import '../utils/routes/routes_name.dart';

class VerificationSuccess extends StatelessWidget {
  const VerificationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              logoWidget(),
              // const SizedBox(height: 30),
              const Column(
                children: [
                  Text(
                    "Verification Successfully",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Your password send to your email please check & Re-Login to your account!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: MyColors.secondaryColor,
                    child:
                        Icon(Icons.check, color: Colors.white, size: 46),
                  ),
                ],
              ),

              // const SizedBox(height: 100),
              AuthConfirmButton(
                title: 'Back to login',
                callBack: () {
                  // Navigator.pushReplacementNamed(context, RouteName.login);

                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteName.login,
                    (Route route) => false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
