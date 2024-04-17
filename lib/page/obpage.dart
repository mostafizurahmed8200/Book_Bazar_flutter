import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _mPageController = PageController();

  // final _initPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _mPageController,
              children: const [
                OBDataWidget(
                    obImage: Constant.ob1Image,
                    headLineText: Constant.ob1Htext,
                    subheadlineText: Constant.ob11Htext),
                OBDataWidget(
                    obImage: Constant.ob2Image,
                    headLineText: Constant.ob2Htext,
                    subheadlineText: Constant.ob22Htext),
                OBDataWidget(
                    obImage: Constant.ob3Image,
                    headLineText: Constant.ob3Htext,
                    subheadlineText: Constant.ob33Htext),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    text: 'Continue',
                    roundCorner: 10.0,
                    backgroundColor: Constant.appColor,
                    width: kScreenSize.width * .80,
                    // height: 60,
                    textColor: Colors.white,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    text: 'Sign in',
                    roundCorner: 10.0,
                    backgroundColor: Constant.appLightTrnsColor,
                    width: kScreenSize.width * .80,
                    // height: 60,
                    textColor: Constant.appColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OBDataWidget extends StatelessWidget {
  final String obImage;
  final String headLineText;
  final String subheadlineText;

  const OBDataWidget(
      {super.key,
      required this.obImage,
      required this.headLineText,
      required this.subheadlineText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(obImage),
          Text(headLineText,
              textAlign: TextAlign.center, style: Constant.headerTextStyle),
          const SizedBox(
            height: 10,
          ),
          Text(subheadlineText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}
