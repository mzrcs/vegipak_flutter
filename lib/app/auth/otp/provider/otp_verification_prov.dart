// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import '../../../navigation/navigation_bar/navigation_bar.dart';
// import '../../../services/sign_up_service.dart';
// import '../../../services/verify_otp_service.dart';
// import '../../sign_up/model/sign_up_model.dart';

// class VerifyOtpProvider extends ChangeNotifier {
//   VerifyOtpService verifyOtpService = VerifyOtpService();
//   FlutterSecureStorage storage = const FlutterSecureStorage();
//   Dio dio = Dio();
//   bool isLoading = false;
//   String code = '';

//   void onSubmitCode(String submitCode) {
//     print(submitCode);
//     code = submitCode;
//     notifyListeners();
//   }

//   void sumbitOtp(SignUpModel model, code, context) {
//     print(code.length);
//     if (code.length != 4) {
//       // SnackBarPop.popUp(context, 'Please enter the OTP', Colors.red);
//     } else {
//       isLoading = true;
//       notifyListeners();
//       verifyOtpService.verifyOtp(model.email, code, context).then(
//         (value) {
//           if (value != null) {
//             SignupServices().signupUser(model, context).then((value) {
//               if (value != null) {
//                 storage.write(key: 'token', value: value.accessToken);
//                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
//                   builder: (context) {
//                     return const BottomNavigationScreen();
//                   },
//                 ), (route) => false);
//                 isLoading = false;
//                 notifyListeners();
//               }
//             });
//           }
//         },
//       );
//     }
//   }
// }
