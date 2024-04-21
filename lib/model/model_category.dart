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
      bookCover: Constant.cat1,
      bookName: "Memory",
      bookMoneyValue: "\$40.00",
    ),
    ModelCategory(
      bookCover: Constant.cat2,
      bookName: "Soul",
      bookMoneyValue: "\$100.00",
    ),
    ModelCategory(
      bookCover: Constant.cat3,
      bookName: "A Milion one",
      bookMoneyValue: "\$20.00",
    ),
    ModelCategory(
      bookCover: Constant.cat4,
      bookName: "Alone",
      bookMoneyValue: "\$70.00",
    ),
    ModelCategory(
      bookCover: Constant.cat5,
      bookName: "Alone",
      bookMoneyValue: "\$70.00",
    ),
    ModelCategory(
      bookCover: Constant.cat6,
      bookName: "Alone",
      bookMoneyValue: "\$70.00",
    ),
  ];
}
