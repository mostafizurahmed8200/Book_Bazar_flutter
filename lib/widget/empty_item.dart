import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyItemWidget extends StatelessWidget {
  final String text;
  final String icon;
  final double? width;
  final double? height;
  final Color? color;

  const EmptyItemWidget(
      {super.key,
      required this.text,
      required this.icon,
      this.width,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            color: color,
            icon,
            width: width,
            height: height,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: Constant.header2TextStyle,
          )
        ],
      ),
    );
  }
}
