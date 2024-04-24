import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../model/model_top_of_week.dart';
import '../bottom_sheet/bottom_sheet_item_widget.dart';

class CardWidgetTopOfWeek extends StatelessWidget {
  final ModelTopOfWeek infoModel;

  const CardWidgetTopOfWeek({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            // <-- SEE HERE
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (BuildContext context) {
            return BottomSheetItemWidget(
              bottomSheetBookCover: infoModel.bookCover,
              bottomSheetBookName: infoModel.bookName,
              bottomSheetBookValue: infoModel.bookMoneyValue,
            ); // Display the bottom sheet
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SizedBox(
          height: 238,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  infoModel.bookCover,
                  fit: BoxFit.fill,
                  height: 180,
                  width: 150,
                ),
              ),
              const SizedBox(
                  height: 8), // Adding some space between the image and text
              Text(
                infoModel.bookName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
