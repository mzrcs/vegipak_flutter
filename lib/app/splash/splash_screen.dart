import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../auth/log_in.dart';
import '../logic/cubit/user_cubit/user_cubit.dart';
import '../logic/cubit/user_cubit/user_state.dart';
// import '../navigation/navigation_bar/view/navigation_bar.dart';
import '../utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  void goToNextScreen() async {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final userState = userCubit.state;

    if (userState is UserLoggedInState) {
      Navigator.pushReplacementNamed(context, RouteName.home);
    } else if (userState is UserLoggedOutState || userState is UserErrorState) {
      // print('object');
      Navigator.pushReplacementNamed(context, RouteName.login);
    } else {
      // Wait/404
    }
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(microseconds: 2500), () {
      goToNextScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        goToNextScreen();
      },
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
