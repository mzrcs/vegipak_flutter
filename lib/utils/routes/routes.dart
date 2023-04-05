import 'package:flutter/material.dart';
import 'package:vegipak/screens/home.dart';
// import 'package:vegipak/screens/login.dart';
import 'package:vegipak/utils/routes/routes_name.dart';
import 'package:vegipak/view/auth/login_screen.dart';
import 'package:vegipak/view/auth/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      // case RouteName.signup:
      //   return MaterialPageRoute(builder: (context) => const SignupScreen());
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
