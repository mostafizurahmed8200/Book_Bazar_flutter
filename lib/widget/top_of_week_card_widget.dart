import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';

import '../model/model_top_of_week.dart';

class CardWidgetTopOfWeek extends StatelessWidget {
  final ModelTopOfWeek infoModel;

  const CardWidgetTopOfWeek({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                infoModel.bookCover,
                fit: BoxFit.fill,
                height: 200,
                width: 150,
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
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
