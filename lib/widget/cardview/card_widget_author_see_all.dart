import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/model/model_authors.dart';
import 'package:book_bazar/page/author_details_screen.dart';
import 'package:flutter/material.dart';

class CardWidgetAuthorSeeAll extends StatelessWidget {
  final ModelAuthors infoModel;

  const CardWidgetAuthorSeeAll({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AuthorDetailsPage(
                authorImage: infoModel.authorImg,
                authorTitle: infoModel.authorTitle,
                authorName: infoModel.authorName),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                infoModel.authorImg,
                fit: BoxFit.fill,
                height: 70,
                width: 70,
              ),
            ),
            const SizedBox(
                width: 10), // Adding some space between the image and text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    infoModel.authorName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2),
                  Wrap(
                    children: [
                      Text(
                        infoModel.authorDescription,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Constant.grey500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
