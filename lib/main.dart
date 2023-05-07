import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:vegipak/app/auth/otp/provider/otp_verification_prov.dart';
// import 'package:vegipak/app/auth/otp/view/otp_screen.dart';
// import 'package:vegipak/app/navigation/order/provider/order_prov.dart';
import 'package:vegipak/app/navigation/settings/provider/settings_provider.dart';
// import 'package:vegipak/app/welcome/onboard_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vegipak/introduction_screens.dart/on_boarding_page.dart';
// import 'package:vegipak/screens/login.dart';
import 'package:vegipak/app/utils/routes/routes.dart';
// import '../globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';

// import 'app/auth/check_sign_in_prov.dart';
// import 'app/auth/login_screen.dart';
// import 'app/auth/provider/login_provider.dart';
import 'app/logic/cubit/user_cubit/user_cubit.dart';
// import 'app/navigation/navigation_bar/provider/index_navigation.dart';
// import 'app/navigation/profile/provider/profile_provider.dart';
// import 'app/navigation/vegitable/provider/vegitable_prov.dart';
import 'app/utils/theme/app_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ),
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // bool _isIntroScreenShownAlready = false;
  // Future<void> checkHasViewedAlready() async {
  //   final SharedPreferences prefs = await globals.sharedPrefs;
  //   bool? isIntroScreenShownAlready =
  //       prefs.getBool("isIntroScreenShownAlready");
  //   if (isIntroScreenShownAlready != null && isIntroScreenShownAlready) {
  //     setState(() {
  //       _isIntroScreenShownAlready = true;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   // checkHasViewedAlready();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
        // providers: [
        //   //----------------
        //   ChangeNotifierProvider(create: (context) => SignIn()),
        //   ChangeNotifierProvider(create: (context) => VerifyOtpProvider()),
        //   ChangeNotifierProvider(create: (context) => SplashProvider()),
        //   ChangeNotifierProvider(create: (context) => NavigationIndex()),
        //   ChangeNotifierProvider(create: (context) => VegitableProv()),
        //   ChangeNotifierProvider(create: (context) => OrderProv()),
        //   ChangeNotifierProvider(create: (context) => ProfileProvider()),
        //   ChangeNotifierProvider(create: (context) => SettingsProvider()),
        // ],
        child:
            Consumer<SettingsProvider>(builder: (context, settingsManager, _) {
          ThemeData theme;
          if (settingsManager.darkMode) {
            theme = AppTheme.dark();
          } else {
            theme = AppTheme.light();
          }
          return MaterialApp(
            title: 'VegiPak',
            debugShowCheckedModeBanner: false,
            theme: theme,
            // theme: ThemeData(primarySwatch: Colors.green),
            // home: _isIntroScreenShownAlready ? const Login() : const OnBoardingPage(),
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: RouteName.splash,
            // home: const LoginScreen(),
          );
        }),
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}
