import 'package:book_bazar/constant/constant.dart';

class ModelBestVendors {
  final String vendorCover;
  final String vendorName;

  ModelBestVendors({
    required this.vendorCover,
    required this.vendorName,
  });

  static List<ModelBestVendors> bestVendorList = [
    ModelBestVendors(
      vendorCover: Constant.vendor1,
      vendorName: 'Wattpad book',
    ),
    ModelBestVendors(vendorCover: Constant.vendor2, vendorName: 'Kuromi'),
    ModelBestVendors(
      vendorCover: Constant.vendor3,
      vendorName: 'Cranel & Co',
    ),
    ModelBestVendors(vendorCover: Constant.vendor4, vendorName: "GooDay"),
    ModelBestVendors(
      vendorCover: Constant.vendor5,
      vendorName: 'Warehouse',
    ),
    ModelBestVendors(
      vendorCover: Constant.vendor6,
      vendorName: 'Peppa Pig',
    ),
    ModelBestVendors(
      vendorCover: Constant.vendor7,
      vendorName: 'Jstor',
    ),
    ModelBestVendors(
      vendorCover: Constant.vendor8,
      vendorName: "Peloton",
    ),
    ModelBestVendors(
      vendorCover: Constant.vendor9,
      vendorName: 'Haymarket',
    ),
  ];
}
