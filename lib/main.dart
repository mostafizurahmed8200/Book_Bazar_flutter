import 'package:book_bazar/page/congratulation_screen.dart';
import 'package:book_bazar/page/login_screen.dart';
import 'package:book_bazar/page/onboardingscreen.dart';
import 'package:book_bazar/page/signup_screen.dart';
import 'package:book_bazar/page/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
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
            appBarTheme: const AppBarTheme(color: Colors.white),
            dialogTheme: const DialogTheme(backgroundColor: Colors.white)),
        routes: {
          'obpage': (context) => const OnboardingPage(),
          'signuppage': (context) => const SignupPage(),
          'congratulationspage': (context) => const CongratulationsPage(),
          'loginpage': (context) => const LoginPage(),
        });
  }
}
