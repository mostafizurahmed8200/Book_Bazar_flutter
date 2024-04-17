import 'package:book_bazar/page/onboardingscreen.dart';
import 'package:book_bazar/page/signup_screen.dart';
import 'package:book_bazar/page/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(color: Colors.white)),
        routes: {
          'obpage': (context) => const OnboardingPage(),
          'signuppage': (context) => const SignupPage(),
        });
  }
}
