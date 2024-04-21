import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/model/model_authors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidgetAuthor extends StatelessWidget {
  final ModelAuthors infoModel;

  const CardWidgetAuthor({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                infoModel.authorImg,
                fit: BoxFit.fill,
                height: 99,
                width: 100,
              ),
            ),
            const SizedBox(
                height: 8), // Adding some space between the image and text
            Text(
              infoModel.authorName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              infoModel.authorTitle,
              style: const TextStyle(
                  fontSize: 15,
                  color: Constant.grey500,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
