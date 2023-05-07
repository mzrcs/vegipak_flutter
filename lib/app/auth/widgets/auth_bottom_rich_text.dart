import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/settings/provider/settings_provider.dart';

class AuthBottomRichText extends StatelessWidget {
  const AuthBottomRichText({
    Key? key,
    required this.onTap,
    required this.detailText,
    required this.clickableText,
    required this.lightColor,
    required this.darkColor,
  }) : super(key: key);
  final Function()? onTap;
  final String detailText;
  final String clickableText;
  final Color lightColor;
  final Color darkColor;
  @override
  Widget build(BuildContext context) {
    final settingsManager =
        Provider.of<SettingsProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: detailText,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      // color: settingsManager.darkMode ? darkColor : lightColor,
                      fontSize: 14,
                    ),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
              TextSpan(
                text: clickableText,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: settingsManager.darkMode ? darkColor : lightColor,
                    ),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
