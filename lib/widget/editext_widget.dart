import 'package:flutter/material.dart';

import '../constant/constant.dart';

class EditTextWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool isEnableSuggestion, isObscureText, isAutocorrect;
  final int? maxLength;

  const EditTextWidget(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      required this.isEnableSuggestion,
      required this.isObscureText,
      required this.isAutocorrect,
      this.maxLength});

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
          obscureText: isObscureText,
          enableSuggestions: isEnableSuggestion,
          autocorrect: isAutocorrect,
          maxLength: maxLength,
          decoration: InputDecoration(
            counterText: "",
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
