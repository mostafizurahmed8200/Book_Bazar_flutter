import 'package:book_bazar/database/db_helper.dart';
import 'package:book_bazar/page/congratulation_screen.dart';
import 'package:book_bazar/page/login_screen.dart';
import 'package:book_bazar/page/notification_screen.dart';
import 'package:book_bazar/page/onboardingscreen.dart';
import 'package:book_bazar/page/signup_screen.dart';
import 'package:book_bazar/page/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'page/forgetpassword_screen.dart';
import 'page/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  String loginFlag = await DBHelper.getLoginFlag();

  runApp(
    MyApp(
      loginFlag: loginFlag,
    ),
  );
}

class MyApp extends StatelessWidget {
  String loginFlag;

  MyApp({super.key, required this.loginFlag});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (loginFlag == 'LoggedIn')
            ? const HomeScreenPage()
            : const SplashScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(color: Colors.white),
            dialogTheme: const DialogTheme(backgroundColor: Colors.white)),
        routes: {
          'obpage': (context) => const OnboardingPage(),
          'signuppage': (context) => const SignupPage(),
          'congratulationspage': (context) => const CongratulationsPage(),
          'loginpage': (context) => const LoginPage(),
          'forgetPasswordPage': (context) => const ForgetPasswordPage(),
          'homeScreenPage': (context) => const HomeScreenPage(),
          'notificationPage': (context) => const NotificationPage(),
        });
  }
}
