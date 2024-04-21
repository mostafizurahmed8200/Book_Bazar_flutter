import 'package:book_bazar/constant/constant.dart';
import 'package:book_bazar/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetItemWidget extends StatelessWidget {
  final String bottomSheetBookCover;
  final String bottomSheetBookName;
  final String bottomSheetBookValue;

  const BottomSheetItemWidget(
      {super.key,
      required this.bottomSheetBookCover,
      required this.bottomSheetBookName,
      required this.bottomSheetBookValue});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SvgPicture.asset(
                Constant.bottomSheetBarBg,
                // color: Colors.grey,
                height: 8,
                width: 100,
              ),
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
              Constant.loreposum,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Constant.review,
              style: Constant.headerTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SvgPicture.asset(Constant.icon_review),
                SvgPicture.asset(Constant.icon_review),
                SvgPicture.asset(Constant.icon_review),
                SvgPicture.asset(Constant.icon_review),
                SvgPicture.asset(
                  Constant.icon_review,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  '(4.0)',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Constant.grey60,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 200,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        Constant.icon_minus,
                        width: 35,
                        height: 35,
                      ),
                      Text(
                        '1',
                        style: Constant.headerTextStyle,
                      ),
                      SvgPicture.asset(
                        Constant.icon_plus,
                        width: 35,
                        height: 35,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  bottomSheetBookValue,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Constant.appColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                    text: Constant.continueShopping,
                    roundCorner: 30,
                    backgroundColor: Constant.appColor,
                    width: MediaQuery.of(context).size.width * .50,
                    textColor: Colors.white),
                const Text(
                  Constant.viewCart,
                  style: TextStyle(
                      fontSize: 20,
                      color: Constant.appColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
