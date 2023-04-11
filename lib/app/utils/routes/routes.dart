import 'package:flutter/material.dart';
import 'package:vegipak/app/auth/forgot_pass/view/forgot_password.dart';
import 'package:vegipak/app/auth/otp/view/otp_screen.dart';
import 'package:vegipak/app/auth/sign_up/view/signup_screen.dart';
import 'package:vegipak/screens/home_screen.dart';
// import 'package:vegipak/screens/login.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';
import 'package:vegipak/app/auth/sign_in/view/sign_in.dart';
// import 'package:vegipak/app/auth/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteName.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case RouteName.forgotPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());
      case RouteName.otp:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      // home
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('No route defined'),
          ),
        );
      },
    );
  }
}
