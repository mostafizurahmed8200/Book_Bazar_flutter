import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../widget/dot_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _mPageController = PageController();

  int _initPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _mPageController.addListener(() {
      setState(() {
        _initPageIndex = _mPageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Padding(
      //     padding: EdgeInsets.all(
      //       30.0,
      //     ),
      //     child: Text(
      //       'Skip',
      //       style: TextStyle(fontSize: 18, color: Constant.appColor),
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (int index) {
                    setState(() {
                      _initPageIndex = index;
                    });
                  },
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
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: DotIndicator(
                    width: 10,
                    height: 10,
                    itemCount: 3, // Number of pages
                    currentIndex: _initPageIndex,
                  ),
                ),
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
                    onCLickButton: () {
                      Navigator.pushNamed(context, 'loginpage');
                    },
                    text: 'LOGIN',
                    roundCorner: 10.0,
                    backgroundColor: Constant.appColor,
                    width: kScreenSize.width * .80,
                    // height: 60,
                    textColor: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    onCLickButton: () {
                      Navigator.pushNamed(context, 'signuppage');
                    },
                    text: 'SIGN UP',
                    roundCorner: 10.0,
                    backgroundColor: Constant.appLightTrnsColor,
                    width: kScreenSize.width * .80,
                    // height: 60,
                    textColor: Constant.appColor,
                    fontWeight: FontWeight.bold,
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

//OB Data Class
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
