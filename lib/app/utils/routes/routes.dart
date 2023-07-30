import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegipak/app/auth/forgot_password.dart';
import 'package:vegipak/app/auth/otp/sign_up_otp.dart';
import 'package:vegipak/app/auth/signup_screen.dart';
import 'package:vegipak/app/auth/verification_success.dart';
import 'package:vegipak/app/navigation/cart/thankyou.dart';
import 'package:vegipak/app/navigation/profile/profile_setting.dart';
import 'package:vegipak/app/navigation/profile/update_my_profile.dart';
import 'package:vegipak/app/navigation/profile/update_password_screen.dart';
import 'package:vegipak/app/splash/splash_screen.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';
import 'package:vegipak/app/welcome/onboard_screen.dart';
import '../../auth/login_screen.dart';
import '../../auth/otp/forgot_password_otp.dart';
import '../../navigation/navigation_bar/navigation_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splash:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteName.onboard:
        return CupertinoPageRoute(
          builder: (context) => const OnboardScreen(),
        );
      case RouteName.thankyou:
        return CupertinoPageRoute(
          builder: (context) => const ThankyouOrder(),
        );
      case RouteName.login:
        return CupertinoPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteName.signup:
        return CupertinoPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case RouteName.otp:
        return CupertinoPageRoute(
          builder: (context) => const SignUpOTP(),
        );
      case RouteName.otpSuccess:
        return CupertinoPageRoute(
          builder: (context) => const VerificationSuccess(),
        );
      case RouteName.forgotPassword:
        return CupertinoPageRoute(builder: (context) => const ForgotPassword());
      case RouteName.forgotPasswordOtp:
        return CupertinoPageRoute(
          builder: (context) => const ForgotPasswordOTP(),
        );

      // home
      case RouteName.home:
        return CupertinoPageRoute(
          builder: (context) => const BottomNavigationScreen(),
        );

      case RouteName.editMyProfile:
        return CupertinoPageRoute(
          builder: (context) => const UpdateMyProfile(),
        );
      case RouteName.updatePassword:
        return CupertinoPageRoute(
          builder: (context) => const UpdatePassword(),
        );
      case RouteName.profileSetting:
        return CupertinoPageRoute(
          builder: (context) => const ProfileSetting(),
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
