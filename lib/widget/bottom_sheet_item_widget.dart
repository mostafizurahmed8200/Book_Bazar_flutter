import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetItemWidget extends StatelessWidget {
  final String bottomSheetBookCover;
  final String bottomSheetBookName;
  const BottomSheetItemWidget(
      {super.key,
      required this.bottomSheetBookCover,
      required this.bottomSheetBookName});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final halfScreenHeight = screenHeight / 1;

    return SizedBox(
      height: screenHeight * .850,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              Constant.bottomSheetBarBg,
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                fit: BoxFit.fill,
                bottomSheetBookCover,
                width: MediaQuery.of(context).size.width * .90,
                height: 350,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bottomSheetBookName,
                  style: Constant.headerTextStyle,
                ),
                SvgPicture.asset(
                  Constant.pr_favorite,
                  width: 25,
                  height: 25,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
