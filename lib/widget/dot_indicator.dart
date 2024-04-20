//Dot Indicator Class
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class DotIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color dotColor;
  final Color activeDotColor;
  final double width;
  final double height;

  const DotIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.dotColor = Colors.grey,
    this.activeDotColor = Constant.appColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex ? activeDotColor : dotColor,
            ),
          ),
        ),
      ),
    );
  }
}
