import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/auth/forgot_pass/view/forgot_password.dart';
import 'package:vegipak/app/auth/otp/view/otp_screen.dart';
import 'package:vegipak/app/auth/provider/login_provider.dart';
import 'package:vegipak/app/auth/provider/signup_provider.dart';
import 'package:vegipak/app/auth/signup_screen.dart';
import 'package:vegipak/app/splash/splash_screen.dart';
// import 'package:vegipak/screens/home_screen.dart';
// import 'package:vegipak/screens/login.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';

import '../../auth/login_screen.dart';
import '../../navigation/navigation_bar/provider/index_navigation.dart';
import '../../navigation/navigation_bar/navigation_bar.dart';
// import 'package:vegipak/app/auth/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.login:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => LoginProvider(context),
            child: const LoginScreen(),
          ),
        );
      case RouteName.signup:
        // return MaterialPageRoute(builder: (context) => const SignupScreen());
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => SignupProvider(context),
            child: const SignupScreen(),
          ),
        );
      case RouteName.forgotPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPassword());
      case RouteName.otp:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      // home
      case RouteName.home:
        return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => NavigationIndex(),
            child: const BottomNavigationScreen(),
          ),
        );
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
