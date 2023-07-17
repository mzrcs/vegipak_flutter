import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/widgets/auth_confim_button.dart';

import '../../utils/routes/routes_name.dart';
import '../../widgets/logo_widget.dart';
import '../navigation_bar/provider/index_navigation.dart';

class ThankyouOrder extends StatelessWidget {
  const ThankyouOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              logoWidget(),
              // const SizedBox(height: 30),
              Column(
                children: [
                  const Text(
                    "Thankyou for Order",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green.withOpacity(0.9),
                    child:
                        const Icon(Icons.check, color: Colors.white, size: 46),
                  ),
                ],
              ),

              // const SizedBox(height: 100),
              AuthConfirmButton(
                title: 'Back to main menu',
                callBack: () {
                  Provider.of<NavigationIndex>(context, listen: false)
                      .currentIndex = 0;
                  Navigator.pushReplacementNamed(context, RouteName.home);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
