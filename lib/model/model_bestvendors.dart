import 'package:book_bazar/constant/constant.dart';

class ModelBestVendors {
  final String bookCover;

  ModelBestVendors({
    required this.bookCover,
  });

  static List<ModelBestVendors> topOfWeekList = [
    ModelBestVendors(
      bookCover: Constant.vendor1,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor2,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor3,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor4,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor5,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor6,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor7,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor8,
    ),
    ModelBestVendors(
      bookCover: Constant.vendor9,
    ),
  ];
}
