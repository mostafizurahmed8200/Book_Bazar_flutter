import 'dart:async';

import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _kNavigateToOnboarding();
  }

  void _kNavigateToOnboarding() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.pushNamedAndRemoveUntil(context, 'obpage', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.appColor,
      body: Center(
        child: Image.asset(
          Constant.splashLogo,
        ),
      ),
    );
  }
}
