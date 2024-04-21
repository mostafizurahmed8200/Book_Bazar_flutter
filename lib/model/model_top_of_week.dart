import 'package:book_bazar/constant/constant.dart';

class ModelTopOfWeek {
  final String bookCover;
  final String bookName;
  final String bookMoneyValue;

  ModelTopOfWeek(
      {required this.bookCover,
      required this.bookName,
      required this.bookMoneyValue});

  static List<ModelTopOfWeek> topOfWeekList = [
    ModelTopOfWeek(
      bookCover: Constant.slideImg2,
      bookName: "Memory",
      bookMoneyValue: "\$40.00",
    ),
    ModelTopOfWeek(
      bookCover: Constant.slideImg3,
      bookName: "Soul",
      bookMoneyValue: "\$100.00",
    ),
    ModelTopOfWeek(
      bookCover: Constant.slideImg4,
      bookName: "A Milion one",
      bookMoneyValue: "\$20.00",
    ),
    ModelTopOfWeek(
      bookCover: Constant.slideImg5,
      bookName: "Alone",
      bookMoneyValue: "\$70.00",
    ),
  ];
}
