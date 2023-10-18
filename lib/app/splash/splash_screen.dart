import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/custom/annotated_widget.dart';
import 'package:vegipak/app/splash/splash_provider.dart';
// import '../custom/annotated_widget.dart';
import '../components/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   Provider.of<SplashProvider>(context, listen: false).splashTimer(context);

  //   super.initState();
  // }
  // Timer? _timer;

  void goToNextScreen() async {
    // final userPrefrence = Provider.of<UserProvider>(context, listen: false);
    // userPrefrence.getUser();
  }

  @override
  void didChangeDependencies() {
    Provider.of<SplashProvider>(context, listen: false).splashTimer(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedWidget(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoWidget(),
              const SizedBox(height: 20),
              const SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  strokeWidth: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _timer!.cancel();
  //   super.dispose();
  // }
}
