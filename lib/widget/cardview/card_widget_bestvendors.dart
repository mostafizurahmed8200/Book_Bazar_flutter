import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../model/model_bestvendors.dart';

class CardWidgetBestVendors extends StatelessWidget {
  final ModelBestVendors infoModel;

  const CardWidgetBestVendors({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Constant.grey60),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            infoModel.vendorCover,
            // fit: BoxFit.fill,

            width: 100,
          ),
        ),
      ),
    );
  }
}
