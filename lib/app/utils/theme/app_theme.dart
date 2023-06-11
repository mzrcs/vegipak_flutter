import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegipak/app/core/constants/my_colors.dart';

// class MyTheme {
//   static const splash = Color(0xFF000000);
//   static const greenColor = Color(0xFF2cb40c);
//   static const whiteColor = Color(0xFFFFFAFA);
//   static const statusBar = Color(0xFF2E3147);
//   static const appBarColor = Color(0xFF222539);
//   // static const greenColor = Color(0xFF2EC492);
//   static const orangeColor = Color(0xFFEB8D2F);
//   static const greyColor = Color(0xFFF4F4F4);
//   static const blueBorder = Color(0xFF3164CE);
//   static const redBorder = Color(0xFFF14336);
//   static const redLight = Color(0xFFFFF1F0);
//   static const blueLight = Color(0xFFF5F9FF);
//   static List<Color> redGiftGradientColors = [
//     const Color(0xFFFCCAC6).withOpacity(0.3),
//     const Color(0xFFDB5449).withOpacity(0.3),
//   ];
//   static List<Color> greenGiftGradientColors = [
//     const Color(0xFF89D980).withOpacity(0.3),
//     const Color(0xFF34BA25).withOpacity(0.3),
//   ];
//   static const redTextColor = Color(0xFFD05045);
//   static const greenTextColor = Color(0xFF8CC153);

//   // static Color primaryColor = const Color(0xFF2cb40c);
//   // static Color primaryColor2 = const Color(0xFF44c43c);
//   // static Color primaryColor3 = const Color(0xFF2dbc29);
//   // static Color lightColor = const Color(0xFF6ace68);

//   static final myLightTheme = ThemeData(
//     primaryColor: splash,
//     scaffoldBackgroundColor: Colors.white,
//     textTheme: TextTheme(
//       subtitle1: TextStyle(color: Colors.white.withOpacity(0.7), inherit: true),
//     ),
//     brightness: Brightness.light,
//     backgroundColor: Colors.white,
//     fontFamily: 'Poppins',
//     buttonTheme: const ButtonThemeData(
//       colorScheme: ColorScheme.light(
//         background: splash,
//         primary: splash,
//       ),
//     ),
//     appBarTheme: const AppBarTheme(
//       color: appBarColor,
//     ),
//   );

//   static final myDarkTheme = ThemeData(
//     primaryColor: splash,
//     scaffoldBackgroundColor: appBarColor,
//     fontFamily: 'Poppins',
//     brightness: Brightness.dark,
//     backgroundColor: appBarColor,
//     buttonTheme: const ButtonThemeData(
//       colorScheme: ColorScheme.dark(
//         background: splash,
//         primary: splash,
//       ),
//     ),
//     appBarTheme: const AppBarTheme(
//       color: appBarColor,
//     ),
//   );
// }

class AppTheme {
  // Text Theme for Light theme mode
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 8,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  // Text Theme for Dark theme mode
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 8,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  // Light ThemeData
  static ThemeData light() {
    return ThemeData(
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return MyColors.kGreenColor;
          }
          return Colors.white;
        }),
        trackColor: MaterialStateColor.resolveWith((states) => Colors.grey),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.kGreenColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        iconSize: 16,
        elevation: 4,
        backgroundColor: MyColors.kGreenColorTint2,
        foregroundColor: Colors.white,
      ),
      splashColor: Colors.white.withOpacity(0.5),
      // splashFactory: NoSplash.splashFactory,
      splashFactory: InkSplash.splashFactory,

      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(MyColors.kGreenColor),
        side: BorderSide(
          color: Colors.grey.shade800,
          width: 1.5,
        ),

        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.black,
        selectedItemColor: MyColors.kGreenColor,
      ),
      textTheme: lightTextTheme,
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: MyColors.kGreenColor,
        circularTrackColor: Colors.grey.shade300,
        refreshBackgroundColor: Colors.grey.shade300,
      ),
    );
  }

  // Dark ThemeData
  static ThemeData dark() {
    return ThemeData(
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return MyColors.kGreenColor;
          }
          return Colors.white;
        }),
        trackColor: MaterialStateColor.resolveWith((states) => Colors.grey),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.kGreenColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        iconSize: 16,
        elevation: 4,
        backgroundColor: MyColors.kGreenColorTint2,
        foregroundColor: Colors.white,
      ),
      splashColor: Colors.white.withOpacity(0.5),
      splashFactory: InkSplash.splashFactory,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(MyColors.kGreenColor),
        side: BorderSide(
          color: Colors.grey.shade800,
          width: 1.5,
        ),

        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MyColors.kBlackColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: MyColors.kBlackColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        selectedItemColor: MyColors.kGreenColor,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: MyColors.kGreenColor,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      textTheme: darkTextTheme,
      scaffoldBackgroundColor: MyColors.kBlackColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: MyColors.kGreenColor,
        circularTrackColor: Colors.grey.shade600,
        refreshBackgroundColor: Colors.grey.shade600,
      ),
    );
  }
}
