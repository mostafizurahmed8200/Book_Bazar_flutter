import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../model/model_category.dart';

class CardWidgetCategory extends StatelessWidget {
  final ModelCategory infoModel;

  const CardWidgetCategory({Key? key, required this.infoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          double.infinity, // Make the card expand to fill the available width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              infoModel.bookCover,
              fit: BoxFit.cover,

              // Adjust the fit to cover the whole area
            ),
          ),
          SizedBox(height: 8), // Adding some space between the image and text
          Column(
            children: [
              Text(
                infoModel.bookName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2),
              Text(
                infoModel.bookMoneyValue,
                style: const TextStyle(
                  fontSize: 15,
                  color: Constant.appColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
