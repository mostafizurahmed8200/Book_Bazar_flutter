import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../model/model_category.dart';

class CardWidgetCategory extends StatelessWidget {
  final ModelCategory infoModel;

  const CardWidgetCategory({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              infoModel.bookCover,
              fit: BoxFit.fill,
              height: 150,
              width: 200,
              // Adjust the fit to cover the whole area
            ),
          ),
          const SizedBox(
              height: 8), // Adding some space between the image and text
          Text(
            infoModel.bookName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Text(
            infoModel.bookMoneyValue,
            style: const TextStyle(
              fontSize: 15,
              color: Constant.appColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
