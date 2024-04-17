import 'package:flutter/material.dart';

import '../constant/constant.dart';

class EditTextWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;

  const EditTextWidget({super.key, required this.hintText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .90,
      decoration: const BoxDecoration(
        color: Constant.grey50,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
