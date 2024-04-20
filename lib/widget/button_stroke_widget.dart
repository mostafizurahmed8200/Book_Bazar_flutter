import 'package:flutter/material.dart';

class ButtonStrokeWidget extends StatelessWidget {
  final String text;
  final double roundCorner;
  final Color? backgroundColor;
  final Color textColor;
  final double? width, height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function? onCLickButton;
  final String iconData;

  const ButtonStrokeWidget({
    super.key,
    required this.text,
    required this.roundCorner,
    required this.iconData,
    this.backgroundColor,
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
          borderRadius: BorderRadius.all(
            Radius.circular(roundCorner),
          ),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconData,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: fontSize, color: textColor, fontWeight: fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}
