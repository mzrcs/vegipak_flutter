// Error
// const userInvalidResponse = 100;
// const noInternet = 101;
// const inValidFormat = 102;
// const unknowError = 400;

import 'package:flutter/material.dart';

const kGreenColor = Color(0xff86d23c);
const kGreenColorTint = Color(0xff92d750);
const kGreenColorTint2 = Color(0xff9edb63);
const kGreenColorTint3 = Color.fromARGB(255, 240, 140, 101);
const kBlackColor = Color(0xff0E0E0E);
const kBlackColor2 = Color.fromARGB(255, 27, 27, 27);
const kRedColor = Color(0xffe53935);
const kGreyColor = Color(0xff232220);
const kGreyColor2 = Color.fromARGB(255, 31, 30, 29);
const kGreyColor3 = Color.fromARGB(255, 92, 91, 90);
const kGreyColor4 = Color.fromARGB(255, 232, 233, 235);
const kGreyColor5 = Color.fromARGB(232, 200, 200, 200);
const kGreyColor6 = Color.fromARGB(232, 187, 188, 182);

OutlineInputBorder kFocusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.shade800),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder kErrorBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kGreyColor),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder kEnabledBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kGreyColor),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder kFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.shade800),
  borderRadius: BorderRadius.circular(10),
);
OutlineInputBorder kBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
);
