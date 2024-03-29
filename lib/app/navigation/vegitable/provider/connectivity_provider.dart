// import 'dart:async';
// import 'dart:developer';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:flutter/material.dart';

// class ConnectivityProvider extends ChangeNotifier {
//   late StreamSubscription subscription;
//   var isDeviceConnected = false;
//   bool isAlertSet = false;

//   getConnectivity(BuildContext context) =>
//       subscription = Connectivity().onConnectivityChanged.listen(
//         (ConnectivityResult result) async {
//           isDeviceConnected = await InternetConnectionChecker().hasConnection;
//           log('device connected $isDeviceConnected');
//           if (!isDeviceConnected && isAlertSet == false) {
//             showDialogBox(context);
//             notifyListeners();
//             isAlertSet = true;
//           }
//         },
//       );

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   void showDialogBox(BuildContext context) => showCupertinoDialog(
//         context: context,
//         builder: (context) => CupertinoAlertDialog(
//           title: const Text('No Connection'),
//           content: const Text('Please check your internet connectivity'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Ok'),
//             )
//           ],
//         ),
//       );
// }
