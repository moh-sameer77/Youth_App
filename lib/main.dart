import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/localization.dart';
import 'package:flutter_application_1/src/config/theme/theme.dart';
import 'package:flutter_application_1/src/feature/login/view/login_screen.dart';
import 'package:flutter_application_1/src/feature/splash_screen/splash_screen.dart';
import 'package:flutter_application_1/src/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: SplashScreen(),
      locale: Locale('en'),
      supportedLocales: [Locale('en'), Locale('ar')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/BottomNavBar',
          page: () => Bottomnavbar()
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen()
        ),
        
      ],
    );
  }
}
