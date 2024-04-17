import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double roundCorner;
  final Color backgroundColor;
  final Color textColor;
  final double? width, height;
  final double? fontSize;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.roundCorner,
      required this.backgroundColor,
      required this.width,
      this.height = 60,
      required this.textColor,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(roundCorner),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
    );
  }
}
