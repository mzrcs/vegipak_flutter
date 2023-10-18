import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegipak/app/auth/provider/forgot_password_provider.dart';
import 'package:vegipak/app/auth/provider/sign_in_provider.dart';
import 'package:vegipak/app/auth/provider/sign_up_provider.dart';
import 'package:vegipak/app/auth/provider/user_provider.dart';
import 'package:vegipak/app/navigation/cart/provider/cart_provider.dart';
import 'package:vegipak/app/navigation/order/provider/order_prov.dart';
import 'package:vegipak/app/navigation/settings/provider/settings_provider.dart';
import 'package:vegipak/app/navigation/vegitable/provider/product_provider.dart';
import 'package:vegipak/app/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/utils/routes/routes_name.dart';
import 'app/navigation/navigation_bar/provider/index_navigation.dart';
import 'app/navigation/profile/provider/profile_provider.dart';
import 'app/splash/splash_provider.dart';
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


  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    // );

    return MultiProvider(
      // create: (context) => SettingsProvider(),
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        //----------------

        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SignupProvider(context)),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),

        ChangeNotifierProvider(create: (context) => NavigationIndex()),

        ChangeNotifierProvider(create: (context) => ProductProvider(context)),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider(context)),

        //----------------
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: Consumer<SettingsProvider>(builder: (context, settingsManager, _) {
        ThemeData theme;
        if (settingsManager.darkMode) {
          theme = AppTheme.dark();
        } else {
          theme = AppTheme.light();
        }
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
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
          },
        );
      }),
    );
  }
}
