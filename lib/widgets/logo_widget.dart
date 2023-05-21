import 'package:flutter/material.dart';
import 'package:vegipak/constants.dart';

Widget logoWidget() {
  return Container(
    height: 120,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(Constants.companyFullLogoLight),
      ),
    ),
  );
}
