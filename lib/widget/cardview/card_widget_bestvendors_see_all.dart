import 'package:book_bazar/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/model_bestvendors.dart';

class CardWidgetBestVendorsSeeAll extends StatelessWidget {
  final ModelBestVendors infoModel;

  const CardWidgetBestVendorsSeeAll({super.key, required this.infoModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Constant.grey60),
          child: Image.asset(
            infoModel.vendorCover,
            // fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          infoModel.vendorName,
          style: Constant.normalTextStyle,
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
          ],
        )
      ],
    );
  }
}
