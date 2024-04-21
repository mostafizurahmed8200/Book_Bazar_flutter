import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double roundCorner;
  final Color backgroundColor;
  final Color textColor;
  final double? width, height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function? onCLickButton;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.roundCorner,
    required this.backgroundColor,
    required this.width,
    this.height = 60,
    required this.textColor,
    this.fontSize = 20,
    this.fontWeight,
    this.onCLickButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onCLickButton != null) {
          onCLickButton!(); // Invoke the function if it's not null
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            roundCorner,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize, color: textColor, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
