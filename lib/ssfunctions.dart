// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';

// import './constants.dart' as Constants;

// bool isEmailValid(String value) {
//   String pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(value))
//     return false;
//   else
//     return true;
// }

// bool isCellPhoneValid(String value) {
//   String pattern = r'^[0-9]{8}$';
//   RegExp regex = new RegExp(pattern);
//   if (!regex.hasMatch(value))
//     return false;
//   else
//     return true;
// }

// String buildQueryStringFromMap(Map<String, Object> params) {
//   String queryParams = '?';

//   params.forEach((key, value) {
//     queryParams += '$key=$value&';
//   });

//   queryParams = queryParams.substring(0, (queryParams.length - 1));

//   return queryParams;
// }

// Future<void> openURL(url) async {
//   try {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       print('Could not launch $url');
//     }
//   } catch (error) {
//     print(error);
//   }
// }
