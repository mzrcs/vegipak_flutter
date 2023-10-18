import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vegipak/app/auth/provider/user_provider.dart';
import 'package:vegipak/app/components/button_widget.dart';
import 'package:vegipak/app/core/constants/my_colors.dart';
import 'package:vegipak/app/custom/annotated_widget.dart';
import '../navigation/navigation_bar/provider/index_navigation.dart';
import 'logo_widget.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key, this.isServerError = false});

  final bool isServerError;

  @override
  Widget build(BuildContext context) {
    return AnnotatedWidget(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                logoWidget(),
                const SizedBox(height: 50),
                if (!isServerError)
                  const Text(
                    'Something goes wrong. \nCheck your connection and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                if (isServerError)
                  const Text(
                    'SOMETHING WENT WRONG',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                if (isServerError) const SizedBox(height: 12),
                if (isServerError)
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 45,
                  ),
                // if (isServerError) const SizedBox(height: 30),
                // if (isServerError)
                //   myButton2(
                //     'TRY AGAIN',
                //     () {
                //       Provider.of<ProductProvider>(context, listen: false)
                //           .getVegitableProduct(context);
                //     },
                //   ),
                if (!isServerError) const SizedBox(height: 30),
                if (!isServerError)
                  myButton2(
                    'TRY AGAIN',
                    () {
                      Provider.of<NavigationIndex>(context, listen: false)
                          .checkInternet();
                      Provider.of<NavigationIndex>(context, listen: false)
                          .showInternetToast(context);
                    },
                  ),
                const Spacer(),
                Consumer<UserProvider>(builder: (context, provider, _) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact us now for your order',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      myButton('CALL US (${provider.businessPhone.toString()})',
                          () {
                        _makePhoneCall(provider.businessPhone.toString());
                      })
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Widget circleIconButton({
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return Material(
      type: MaterialType
          .transparency, //Makes it usable on any background color, thanks @IanSmith
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.kGreenColor, width: 1.0),
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          //This keeps the splash effect within the circle
          borderRadius: BorderRadius.circular(
              1000.0), //Something large to ensure a circle
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              iconData,
              size: 25.0,
              color: MyColors.kGreenColor,
            ),
          ),
        ),
      ),
    );
  }
}
