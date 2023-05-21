import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegipak/app/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Timer? _timer;

  void goToNextScreen() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove('email');
    // sp.remove('first_name');
    // sp.remove('last_name');
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // _timer = Timer(const Duration(microseconds: 2500), () {
  //   //   goToNextScreen();
  //   // });
  // }

  @override
  void didChangeDependencies() {
    Provider.of<SplashProvider>(context, listen: false).splashTimer(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  // @override
  // void dispose() {
  //   _timer!.cancel();
  //   super.dispose();
  // }
}
