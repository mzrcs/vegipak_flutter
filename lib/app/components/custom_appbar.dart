import 'package:flutter/material.dart';
import 'package:vegipak/app/core/constants/my_colors.dart';

customAppBar({
  required BuildContext context,
  required String appBarTitle,
}) {
  return AppBar(
    // backgroundColor: Colors.white,
    elevation: 3,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: MyColors.kBlackColor,
        size: 24,
      ),
    ),
    centerTitle: false,
    title: Text(
      appBarTitle,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ),
  );
}
