import 'package:book_bazar/constant/constant.dart';

class ModelCategory {
  final String bookCover;
  final String bookName;
  final String bookMoneyValue;

  ModelCategory(
      {required this.bookCover,
      required this.bookName,
      required this.bookMoneyValue});

  static List<ModelCategory> categoryList = [
    ModelCategory(
      bookCover: Constant.slideImg2,
      bookName: "Memory",
      bookMoneyValue: "\$40.00",
    ),
    ModelCategory(
      bookCover: Constant.slideImg3,
      bookName: "Soul",
      bookMoneyValue: "\$100.00",
    ),
    ModelCategory(
      bookCover: Constant.slideImg4,
      bookName: "A Milion one",
      bookMoneyValue: "\$20.00",
    ),
    ModelCategory(
      bookCover: Constant.slideImg5,
      bookName: "Alone",
      bookMoneyValue: "\$70.00",
    ),
    ModelCategory(
      bookCover: Constant.cat1,
      bookName: "The Da Vinci Code",
      bookMoneyValue: "\$40.00",
    ),
    ModelCategory(
      bookCover: Constant.cat2,
      bookName: "Carrie Fisher",
      bookMoneyValue: "\$100.00",
    ),
    ModelCategory(
      bookCover: Constant.cat3,
      bookName: "The Good Sister",
      bookMoneyValue: "\$20.00",
    ),
    ModelCategory(
      bookCover: Constant.cat4,
      bookName: "The Waiting",
      bookMoneyValue: "\$70.00",
    ),
    ModelCategory(
      bookCover: Constant.cat5,
      bookName: "Where are your name",
      bookMoneyValue: "\$70.00",
    ),
    ModelCategory(
      bookCover: Constant.cat6,
      bookName: "Bright Young Women",
      bookMoneyValue: "\$70.00",
    ),
  ];
}
