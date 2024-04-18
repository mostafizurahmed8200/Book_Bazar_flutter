import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';

import '../widget/button_widget.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Constant.congratulationsIcon),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Congratulations!',
                style: Constant.headerTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'your account is complete, please enjoy the best menu from us.',
                  style: Constant.subHeaderTextStyle,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                text: 'Get Started',
                roundCorner: 50,
                height: 50,
                backgroundColor: Constant.appColor,
                width: MediaQuery.of(context).size.width * .60,
                textColor: Colors.white,
                onCLickButton: () {
                  Navigator.pushNamed(context, 'loginpage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
